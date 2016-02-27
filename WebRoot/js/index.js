// JavaScript Document

(function (){
		document.write('<link rel="stylesheet" type="text/css" href="css/mydialog.css" />');
		document.write('<script src="javascript/modernizr.custom.js"></script>');
		document.write('<script src="javascript/classie.js"></script>');
		document.write('<script>var polyfilter_scriptpath = "/js/";</script>');
})();

$.extend({
	my_show_dialog:function(modal){
		var overlay = document.querySelector( '.md-overlay' );
		var modal = document.querySelector( '#'+modal  );
		var	close = modal.querySelector( '.md-close' );

		function removeModal( hasPerspective ) {
			classie.remove( modal, 'md-show' );

			if( hasPerspective ) {
				classie.remove( document.documentElement, 'md-perspective' );
			}
		}

		function removeModalHandler() {
			removeModal( true ); 
		}
		
		function removeModalHandler2() {
			$(".md-modal .my_scroll").css('overflow-y','hidden');
			$(".md-modal").css("display","none");
			removeModal( true ); 
		}

	
		classie.add( modal, 'md-show' );
		overlay.removeEventListener( 'click', removeModalHandler2 );
		overlay.addEventListener( 'click', removeModalHandler2 );

		setTimeout( function() {
			classie.add( document.documentElement, 'md-perspective' );
		}, 700 );
		
		close.addEventListener( 'click', function( ev ) {
			ev.stopPropagation();
			removeModalHandler();
		});
	}
});

(function ($) { 
	//屏蔽，适合单个元素. 
	$.fn.mask = function () { 
		var divHtml = '<div class="divMask" style="position: absolute; width: 100%; height: 100%; left: 0px; top: 0px; background: #fff; opacity: 0; filter: alpha(opacity=0)"> </div>'; 
		$(this).wrap('<div style="position: relative;display: inline-block;"></div>'); 
		$(this).parent().append(divHtml); 
		$(this).data("mask","true"); 
	} 
	//取消屏蔽 
	$.fn.unmask = function () { 
	$(this).parent().find(".divMask").remove(); 
	$(this).unwrap(); 
	$(this).data("mask", "false"); 
	} 
})(jQuery); 

$(function() {
		
	
		$(".close_left").hover(
		  function(){
			  $(".main_left").stop().animate({ width: '200',opacity:'show' }, { duration: 200});
			  $(".main_right").stop().animate({ width: '1000' }, { duration: 200})
		  });   
		
		$(".main_left").hover(
			function() {
				$(".close_left"	).stop().animate({ opacity: 'hide' }, { duration: "slow"});
			},function() {
				  $(".main_right").stop().animate({ width: '1175' }, { duration: 200})
				$(".close_left"	).stop().animate({ opacity: 'show' }, { duration: "slow"});
				$(".main_left"	).stop().animate({ width: '0',opacity:'hide' }, { duration: 200})
		});
		
		
		var i=0,j=1,max_i=0;
		$(".my_table tr").each(
		function() {
			i=0;
			j++;
			$(this).children().each(
			function(){
				i++;
				if(max_i<i) max_i=i;
				if(j%2==0) {
					if(i%2==0) {
						$(this).css('background','#95DCF0');			 
					}else {
						$(this).css('background','#5EC9E8');	
					}
				}else {
					$(this).css('background','#ecf0f1');	
				}
				
			});
		});
		
		//修改间距
		var fs=30;
		fs=Math.round(fs-(max_i-3)*4);
		fs=fs>10?fs:10;
		fs=fs<30?fs:30;
		$(".my_table td").css('padding', '5px '+fs+'px');
		
		
		max_i=0;
		$(".my_table_top tr").each(
		function() {
			i=0;
			$(this).children().each(
			function(){
				i++;
				if(max_i<i) max_i=i;
			});
		});
		
		//修改间距
		fs=30;
		fs=Math.round(fs-(max_i-3)*4);
		fs=fs>10?fs:10;
		fs=fs<30?fs:30;
		$(".my_table_top td").css('padding', '5px '+fs+'px');
		
		
		
		$(".my_table_head").css("text-align",'center').css("font-size",'24px').css('font-family','微软雅黑')
		.css('font-weight','bolder').css('color','white').css('background','#3498db');
		
		$('.nav_a')
		.css( {backgroundPosition: "0 0"} )
		.hover(
			function(){
			$(this).stop().animate({backgroundPosition:"(0 -120px)"}, {duration:400})
		},function(){
			$(this).stop().animate({backgroundPosition:"(0 0)"}, {duration:300, complete:function(){
				$(this).css({backgroundPosition: "0px 0px"})
			}})
		});
		
		$(".my_button,.my_button_add,.my_button_update,.my_button_delete,.my_button_back,.my_button_search,.my_button_search_all,.my_button_bokuan,.my_button_checked,.my_button_return,.my_button_daochu,.my_button_load").css( {backgroundPosition: "0 0"} )
		.hover(
			function(){
			$(this).stop().animate({backgroundPosition:"(-110px 0)"}, {duration:400})
		},function(){
			$(this).stop().animate({backgroundPosition:"(-190px 0)"}, {duration:200, complete:function(){
				$(this).css({backgroundPosition: "0px 0px"})
			}})
		});
		
		$(".my_button_ykjh").hover(
			function(){
				$(this).stop().animate({backgroundPosition:"(-180px 0)"}, {duration:400})
			},function(){
				$(this).stop().animate({backgroundPosition:"(-360px 0)"}, {duration:200, complete:function(){
					$(this).css({backgroundPosition: "0px 0px"})
				}})
		});
		
		j=1;
		$(".my_nextpage_button").each(function() {
        	j++;   
        });
		$(".my_nextpage_div").css("width",58*j);
		
		j=0;
		$(".my_button_div span").children().each(function() {
        	j++;   
        });
		$(".my_button_div").css("width",87*j);
		//main 高度
		$(".main").css('height',$(".main_right").css('height'));
		$(".main_left").css('height',$(".main_right").css('height'));
		
		
		//退出
		$(".my_out").click(function() {
			window.location.href="UserAction!logout";
		})
		
		//屏蔽选择框
		$(".my_select").mask();
		$(".my_radio").mask();
		
		//不显示对话框
		$(".md-modal").css("display","none");
		
		/*
		$(".ztree span").click(function(){
			//！！！调整位置
			var w = $("#modal2").width();
			var h = $("#modal2").height();
			var m = ""+(-h/2)+"px";
			m += " "+(-w/2)+"px";
			$("#modal2").css('margin',m);
		})
		*/
		
		
		
		//下拉菜单
		var t1;
		$(".my_user").hover(
			function() {
				t1=setTimeout(
					function() {
						$(".nav_list").show();
					},500);
			}, function() {
				clearTimeout(t1);
				$(".nav_list").hide();
			}
		);
		
		$("#searchButton").click(
			function() {
				self.location=$(".nav_peron_a").attr("href")+"/search/"+$('#searchInput').val();
			
		});
		
});



//ajax选择框
function createHead(name) {
	$("#my_show_table").html("");
	var text="<tr>";
		for(var i in name) {
			text+="<td>"+name[i]+"</td>";
		}
	text+="</tr>";
	$("#my_show_table").append(text);
}

function createBody(json,index) {
	var text="<tr>";
	for(var i in json) {
		if(i==0) {
			text+="<td><input type='radio' name='item_id' value='"+index+"'/></td>";
		} else {
			text+="<td>"+json[i]+"</td>";
		}
	}
	text+="</tr>";
	$("#my_show_table").append(text);
}
	
var itemList;

function my_dialog_show(id) {
	//显示方式
	do{
		var my_id = Math.floor(Math.random()*16+1);
	}while(my_id==12||my_id==7||my_id==16||my_id==13);
	$("#"+id).removeClass().addClass("md-modal md-effect-"+my_id);

}

function my_ajax(my_url,name,class_array,head_name) {
	if(head_name==null) head_name="选择相关数据";
	
	//设置标题
	$("#data_body h3").html(head_name);
	my_dialog_show("modal");

	$.ajax({
		    type: "POST",
		    url: my_url,
		    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
		    success: function(json){  
			    var obj = $.parseJSON(json);  //使用这个方法解析json
			    itemList = obj[class_array[0]];  //result是和action中定义的result变量的get方法对应的				    
			    createHead(name);
			    for(var i in itemList) {
			    	var body = new Array();
			    	for(var j in class_array) {
			    		if(j==0)continue;
			    		body[j-1]=itemList[i][class_array[j]];
			    	}
			    	createBody(body,i);
			    }
			    
			    //显示dialog
				//！！！调整位置
				var w = $("#modal").width();
				var h = $("#modal").height();
				var m = ""+(-h/2)+"px";
				m += " "+(-w/2)+"px";
				$("#modal").css('margin',m);
				//设置样式
				$("#modal .my_scroll").css({'overflow-y':'scroll'});
				
				$("#modal").css("display","block");
				$.my_show_dialog("modal");		
		    },
		    error: function(json){
			     alert("获取失败，后台数据已修改");
			     return false;
		    }
		});
} 

function close_click() {
	$(".md-close").unbind('click');
	$(".md-close").bind('click',function(e){
		$(".md-modal .my_scroll").css('overflow-y','hidden');
		$(".md-modal").css("display","none");	
	});
}

function close_click(id,show) {
	$(".md-close").unbind('click');
	$(".md-close").bind('click',function(e){
		$(".md-modal .my_scroll").css('overflow-y','hidden');
		$(".md-modal").css("display","none");
		
		var item = $("#"+id);
		item.html("");
		
		var select = $('input[name="item_id"]:checked');
		if(select.length == 0) return;
		item.append("<option value='"+ itemList[select.val()]['id'] +"'>"+ itemList[select.val()][show] +"</option>");
	
	});
}

function close_click_text(id,show) {
	$(".md-close").unbind('click');
	$(".md-close").bind('click',function(e){
		$(".md-modal .my_scroll").css('overflow-y','hidden');
		$(".md-modal").css("display","none");
		
		var item = $("#"+id);
		
		var select = $('input[name="item_id"]:checked');
		if(select.length == 0) return;
		item.val(itemList[select.val()][show]);
	
	});
}
