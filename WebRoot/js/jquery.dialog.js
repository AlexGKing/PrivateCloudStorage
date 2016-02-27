/**
 * Dialog 1.0.0
 *
 * (c) 2011 愚人码头
 * http://www.css88.com/
 */

jQuery.fn.dialog=function(option){
	var option = option || {};
	return this.each(function(){
		
	});
}
//Dialog Class
function Dialog(element,options){
	this.TpageWidth=$("body").width();
	this.TpageHeight=$(document).height();
	this.dialog=$(Dialog.WRAPPER);
	jQuery.data(this.dialog[0], 'dialog', this);
	this.visible = false;
    this.options = jQuery.extend({}, Dialog.DEFAULTS, options || {});
	var self = this;
	
	this.dialog.css({
		'display':'none',
		'width':self.options.width ? self.options.width : self.width
	}).appendTo(document.body);
	this._setupTitleBar();
	
	this.setContent(element || '<div>暂无内容...</div>');
	if (this.options.show) {
		this.show();
	}
}

$.extend(Dialog,{
	WRAPPER:'<div class="dialog-box"><div class="dialog-popup"><div class="dialog-content"></div></div></div>',
	DEFAULTS: {
		width:"200px",          //宽度
        title: null,           // 标题.
        closeable: true,           // 是否显示关闭按钮
        show: true,           // 立即显示dialog?
        modal: false,          // 半透明遮罩背景
        modalOpacity: 0.7,       //默认模态背景透明度
        closeText: '关闭窗口',      // 关闭窗口的提示文字
        closeDelay: 0,           //自动关闭的延时时间，单位：毫秒
        dTopNum:false,          //弹框的top值，默认居中；
		closeModal:true          //关闭模式
    },
    //页面加载
    load:function(url,options){
        var options = options || {};
        //var loadHtml=;
        jQuery.ajax({
            url:url,
            type:"GET",
            dateType:"html",
            cache:false,
            success:function(html){
                html = jQuery(html);
                new Dialog(html, options);
            }
        });
    },
    //
    frame:function(frameId,url,options){
        var options = options || {};

        var frameHtml=$("<iframe>",{
            'id': frameId,
            'src':url,
            'name':frameId,
            'frameBorder':0,
            'scrolling':'no',
            'width':'100%',
            load:function(){
                var ifm= document.getElementById(frameId);
                var subWeb = document.frames ? document.frames[frameId].document : ifm.contentDocument;
                if(ifm != null && subWeb != null) {
                    ifm.height = subWeb.body.scrollHeight;
                }
            }
        });
        new Dialog(frameHtml, options);
    },
    get: function(ele) {
        return p = $(ele).parents('.dialog-box');
    },
    //提示框
	popTip:function(title,message,delay,options){
		var settings=$.extend({modal: false, closeable: true, title: title, closeDelay: delay}, options || {});
		var html = $('<div></div>').append(message);
        new Dialog(html, settings);
	},
    //询问框
	ask:function(question, answers, callback, options){
		options = $.extend({modal: true, closeable: false},options || {});
        var body =$("<div></div>").append($('<div class="question"></div>')).html(question);
        var map = {}, answerStrings = [];
        if (answers instanceof Array) {
            for (var i = 0; i < answers.length; i++) {
                map[answers[i]] = answers[i];
                answerStrings.push(answers[i]);
            }
        } else {
            for (var k in answers) {
                map[answers[k]] = k;
                answerStrings.push(answers[k]);
            }
        }
        var buttons = $('<form class="answers"></form>');
        buttons.html(jQuery.map(answerStrings, function(v) {
			//add by zhangxinxu http://www.zhangxinxu.com 给确认对话框的确认取消按钮添加不同的class
			var btn_index;
			if(v === "确定"){
				btn_index = 1;
			}else if(v === "取消"){
				btn_index = 2;
			}else{
				btn_index = 3;
			}
			//add end.  include the 'btn_index' below
            return "<input class='boxy-btn"+btn_index+"' type='button' value='" + v + "' />";
        }).join(' '));
        jQuery('input[type=button]', buttons).click(function() {
            var clicked = this;
            Dialog.get(this).hide();
            $(".boxy-modal-blackout").hide();
            if (callback) {
                callback(map[clicked.value]);
            }
        });
        body.append(buttons);
        new Dialog(body, options);
	}
});
Dialog.prototype={
	//显示
	show:function(){
		if (this.visible) return;
		var self = this;
		this._setupIframeMask();
		this.dialog.stop().css({
			'top':self.getPositionTop().dTop,
			'left':self.getPositionTop().dLeft
		}).stop().show();
		this.visible=true;
		if(this.options.closeDelay>0){
			var closeDialogTimer= setTimeout(function(){
				self.hideDialog()
			},this.options.closeDelay)
		}
	},
	
	//窗口尺寸
	getWinSize:function(){
		return {winW:$(window).width(),winH:$(window).height()};
	},
	//滚动条位置
	getWinScrollPosition:function(){
		return {
			dScrollTop: $(window).scrollTop(),
			dScrollLeft: $(window).scrollLeft()
		};
	},
/*	getHideSize:function(){
		this.dialog.css({
			"visibility":"hidden",
			"display":"block"
		});
		var _hideSize=this.getSize();
		this.dialog.css({
			"visibility":"visible",
			"display":"none"
		});
		return _hideSize;
	},*/
	//Dialog尺寸
	getSize:function(){
		return {dWidth:this.dialog.width(),dHeight:this.dialog.height()}
	},
	//Dialog位置
	getPositionTop:function(){
		return{
			dTop:this.options.dTopNum || Math.floor((this.getWinSize().winH-this.getSize().dHeight)/2)+this.getWinScrollPosition().dScrollTop,
			dLeft:Math.floor((this.getWinSize().winW-this.getSize().dWidth)/2)+this.getWinScrollPosition().dScrollLeft
			} 
	},
	//获取dialog
	getDialog: function() {
        return $(".dialog-popup",this.dialog);
    },
    _setupIframeMask:function(){
    	if (this.options.modal){
			if (!this.iframeMask) {
				this.iframeMask = $('<div class="boxy-modal-blackout"></div>').css({
                    opacity: this.options.modalOpacity,
                    width: this.TpageWidth,
                    height: this.TpageHeight
                }).appendTo(document.body);
				if ($.browser.msie && parseFloat($.browser.version) < 7) {
					var iframeMask = $("<iframe>", {
						'id': 'sodaoModalIframeMask',
						'src': "javascript:\'\';",
						'class': 'dialog-iframe-mask'
					}).css({
						opacity: 0,
						width: '100%',
						height: this.TpageHeight
					});
					$(this.iframeMask).append(iframeMask);
				}
			}else{
				$(this.iframeMask).show()
			}
    	}else{
    		if($.browser.msie && parseFloat($.browser.version) < 7){
				var iframeMask1=$("<iframe>",{
					'src':"javascript:\'\';",
					'class':'dialog-iframe-mask'
				}).css({opacity: 0, width: '100%',
				    height: this.getSize().dHeight
				});
				this.dialog.append(iframeMask1);
    		}
    	}
    	
    },
	//安装title条
	_setupTitleBar:function(){
		var self=this;
		 if (this.options.title || this.options.title == '') {
		 	var titleO=$("<div>",{
				'class':'dialog-title-bar',
				'html':'<h2>'+ this.options.title +'</h2>'
			});
			
			if(this.options.closeable){
				$("<a>",{
					'href':'#',
					'class':'close-dialog',
					'title':this.options.closeText,
					'html':'X',
					click:function(){
						self.hideDialog();
					}
				}).appendTo(titleO);
			}
			this.getDialog().prepend(titleO);
			
		 }
	},
	//隐藏或移除Dialog
	hideDialog:function(){
		if (this.iframeMask){
			$(this.iframeMask).hide();
		}
		if (this.options.closeModal) {
			this.dialog.stop().hide();
		}else{
			this.dialog.stop().remove();
		}
	},
	//设置Dialog内容
	setContent:function(contentHtml){
		$(".dialog-content",this.getDialog()).append(contentHtml);
	}
};
