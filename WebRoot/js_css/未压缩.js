/*
 @url:http://www.yxsss.com/ui/
 @name:易U
*/
var F={
	on:function(el,ev,fn){
		if(el.attachEvent){
			el.attachEvent("on"+ev,function(){
				fn.apply(el,arguments)
			})
		}
		else{
			el.addEventListener(ev,fn,false)
		}
	}
	,addcss:function(d,css){
		var css=css||this.css,cs=d.className.replace(/\s{2,}/g,' ').split(' '),c=true;
		for(var i=0,l=cs.length;i<l;i++){
			if(cs[i]==css){
				c=false;
				break;	
			}
		}
		if(c){d.className=cs.join(' ')+' '+css;}
		if(css==this.css){this.zt=true;}
	}
	,hascss:function(d,css){
		var css=css||this.css,cs=d.className.replace(/\s{2,}/g,' ').split(' '),c=false;
		for(var i=0,l=cs.length;i<l;i++){
			if(cs[i]==css){
				c=true;
				break;
			}
		}
		return c;
	}
	,remove:function(d,css){
		var css=css||this.css,cs=d.className.replace(/\s{2,}/g,' ').split(' '),c=[];
		for(var i=0,l=cs.length;i<l;i++){
			if(cs[i]!=css){
				c.push(cs[i]);
			}
		}
		d.className=c.join(' ');
	}
	,css:'F_css',ts:'',zt:false,st1:function(em){
		eval('var re = new RegExp(/'+em.getAttribute('exp')+'/)');
		if(!re.test(em.value)){
			this.addcss(em);
			this.ts+=this.tsf(em,'格式不正确！')
		}
		else{
			this.remove(em)
		}
	}
	,st2:function(em){
		if(em.type=='checkbox'&&em.checked==false){
			this.addcss(em);
			this.ts+='请选择'+this.tsf(em,'')+'！<br>'
		}
		else if(em.value.replace(/\s/g,'')==''||(typeof(em.getAttribute('def'))=='string'&&em.value==em.getAttribute('def'))){
			this.addcss(em);
			this.ts+=this.tsf(em,'不能为空！')
		}
		else if(em.type=='checkbox'&&em.checked==true){
			this.remove(em)
		}
		else if(em.value.replace(/\s/g,'')!=''){
			this.remove(em)
		}
	}
	,st3:function(em){
		if(em.value!=''){
			eval('var re = new RegExp(/'+em.getAttribute('exp')+'/)');
			if(re.test(em.value)){
				this.remove(em);
				this.ts+=this.tsf(em,'格式不正确！')
			}
			else{
				this.addcss(em)
			}
		}
		else{
			this.remove(em)
		}
	}
	,st4:function(em){
		if(em.value==''){
			em.value=em.getAttribute('def');
			if(typeof(em.form.getAttribute('dcss'))=='string'){
				this.addcss(em,em.form.getAttribute('dcss'))
			}
		}
	}
	,st5:function(em){
		if(em.value==em.getAttribute('def')){
			em.value='';
			if(typeof(em.form.getAttribute('dcss'))=='string'){
				this.remove(em,em.form.getAttribute('dcss'))
			}
		}
	}
	,tsf:function(a,b){
		if(typeof(a.getAttribute('ts'))=='string'){
			var s=a.getAttribute('ts');
			if(s){
				return s+'<br>'
			}
			else{
				return''
			}
		}
		else{
			return A.s(a.parentNode).innerHTML+b+'<br>'
		}
	}
	,st:function(){
		var fs=document.forms;
		for(var a=0,l=fs.length;a<l;a++){
			if(typeof(fs[a].f)!='undefined'){
				continue
			};
			fs[a].f=false;
			for(var b=0,j=fs[a].length;b<j;b++){
				if(typeof(fs[a][b])!='undefined'){
					if(typeof(fs[a][b].getAttribute('req'))=='string'&&fs[a][b].getAttribute('req')=="true"){
						if(typeof(fs[a][b].getAttribute('exp'))=='string'){
							this.on(fs[a][b],'blur',function(){
								F.st1(this)
							})
						}
						else{
							this.on(fs[a][b],'blur',function(){
								F.st2(this)
							})
						}
					}
					else if(typeof(fs[a][b].getAttribute('exp'))=='string'){
						this.on(fs[a][b],'blur',function(){
							F.st3(this)
						})
					};
					if(typeof(fs[a][b].getAttribute('fname'))=='string'){
						this.aimg(fs[a][b])
					};
					if(fs[a][b]&&typeof(fs[a][b].getAttribute('def'))=='string'){
						this.on(fs[a][b],'blur',function(){
							F.st4(this)
						});
						this.on(fs[a][b],'focus',function(){
							F.st5(this)
						})
					}
				}
			};
			this.on(fs[a],'submit',function(e){
				F.zt=false;
				F.ts='';
				for(var i=0,j=this.length;i<j;i++){
					if(typeof(this[i].getAttribute('req'))=='string'&&this[i].getAttribute('req')=="true"){
						if(this[i].type=='radio'){
							var rs=this[this[i].name],z=true;
							for(var r=0;r<rs.length;r++){
								if(rs[r].checked){
									z=false;
									break
								}
							};
							if(z){
								F.addcss(rs[0]);
								F.ts+=F.tsf(this[i],'不能为空！',true)
							};
							i+=(rs.length-1)
						}
						else if(typeof(this[i].getAttribute('exp'))=='string'){
							F.st1(this[i])
						}
						else{
							F.st2(this[i])
						}
					}
					else if(typeof(this[i].getAttribute('exp'))=='string'){
						F.st3(this[i])
					};
					if(this[i]&&typeof(this[i].getAttribute('def'))=='string'){
						if(this[i].value==this[i].getAttribute('def')){
							this[i].value=''
						}
					}
				};
				if(F.zt){
					if(F.ts){
						ui.alert(F.ts.replace(/：/g,''))
					};
					if(e.preventDefault)e.preventDefault();
					else e.returnValue=false
				}
				else{
					this.f=true;
					if(this.fun){
						this.fun()
					}
				}
			});
			if(typeof(fs[a].getAttribute('onsubmit'))!='undefined'){
				fs[a].fun=fs[a].onsubmit;
				fs[a].onsubmit=''
			}
		}
	}
	,aimg:function(o){
		var n=o.getAttribute('fname');
		var fun=o.getAttribute('funbak');
		var sf=o.getAttribute('funstr') || false;
		var u=o.getAttribute('furl')||window.location.href;
		var f=A.$$('div');
		var w=o.offsetWidth + 140;
		with(f.style){
			position='absolute';
			zIndex=99;
			overflow='hidden';
			filter='alpha(opacity=0)';
			opacity='0.0';
			display='none'
		};
		if(A.$(n+'_i')){
			A.d(A.$(n+'_i').parentNode)
		};
		f.innerHTML='<form method="post" enctype="multipart/form-data" action="'+u+'" target="'+n+'_i" ><input type="file" onchange="this.form.submit();F.upimg(\''+n+'_i\',\''+fun+'\','+sf+');" name="'+n+'" style="margin-left:-140px;cursor:pointer; width:'+w+'px;" /></form><iframe name="'+n+'_i" id="'+n+'_i" style="display:none"></iframe>';
		o.ob=f;
		F.on(o,'mouseover',function(){
			var wz=A.wz(this);
			var w=this.offsetWidth;
			var h=this.offsetHeight;
			var s=0,p=this.parentNode;
			while(p&&p.tagName.toLowerCase()!='body'){
				if(p.scrollTop)s+=parseInt(p.scrollTop);
				p=p.parentNode
			};
			with(this.ob.style){
				display='block';
				top=wz.y-s+'px';
				left=wz.x+'px';
				height=h+'px';
				width=w+'px'
			};
			var fm=this.ob.children[0];
			with(fm.style){
				height=h+'px';
				width=w+'px';
				overflow='hidden'
			};
			fm.children[0].style.height=h+'px';
			var sel=this;
			if(typeof(this.f)=='undefined'||!this.f){
				this.f=setInterval(function(){
					if(typeof(sel.offsetHeight)=='undefined'||!sel.offsetHeight){
						sel.ob.style.display='none';
						clearInterval(sel.f);
						sel.f=''
					}
				}
				,100)
			}
		});
		document.body.appendChild(f);
		f.children[0].f=true
	}
	,upimg:function(a,b,f){
		if(f){
			f()
		};
		try{
			var s=window.frames[a].document.body.innerHTML
		}
		catch(ev){
			var s=''
		};
		if(s){
			eval('s='+s);
			window.frames[a].document.body.innerHTML='';
			if(typeof(b)=='string'){
				eval(b+'(s)')
			}
			else{
				b(s)
			}
		}
		else{
			setTimeout(function(){
				F.upimg(a,b,false)
			}
			,500)
		}
	}
};
var A={
	$:function(a){
		return document.getElementById(a)
	}
	,$$:function(a){
		if(a.indexOf('<')==-1){
			return document.createElement(a);
		}
		else{
			var _1=document.createElement('div');
			_1.innerHTML=a;
			return _1.children[0];
		}
	}
	,r:function(n,m,f){
		if(f){
			return Math.random()*(m-n)+n
		}else{
			return Math.round(Math.random()*(m-n)+n);
		}
	}
	,d:function(a){
		a.parentNode.removeChild(a)
	}
	,wc:function(n,v,h){
		var _e=new Date((new Date()).getTime()+1000*h);
		_e="; expires="+_e.toGMTString();
		document.cookie=n+"="+escape(v)+_e
	}
	,s:function(a){
		return a.previousElementSibling||a.previousSibling
	}
	,x:function(a){
		return a.nextElementSibling||a.nextSibling
	}
	,rc:function(n){
		var v="";
		var s=n+"=";
		if(document.cookie.length>0){
			w=document.cookie.indexOf(s);
			if(w!=-1){
				w+=s.length;
				end=document.cookie.indexOf(";",w);
				if(end==-1)end=document.cookie.length;
				v=unescape(document.cookie.substring(w,end))
			}
		};
		return v
	}
	,ajone:[],
	aj:function(url,data,f,gs){
		var self=this;
		var k=url.replace(/[^\w]/g,'');
		if(typeof(self.ajone[k])=='undefined'){
			self.ajone[k]=true;
			if(window.XMLHttpRequest){
				var xm=new XMLHttpRequest()
			}
			else{
				var M=['MSXML2.XMLHTTP','Microsoft.XMLHTTP','MSXML2.XMLHTTP.5.0','MSXML2.XMLHTTP.4.0','MSXML2.XMLHTTP.3.0'];
				for(n=0;n<M.length;n++){
					try{
						var xm=new ActiveXObject(M[n]);
						break
					}
					catch(e){}
				}
			};
			xm.open("post",url,true);
			xm.setRequestHeader("is_ajax","1");
			xm.onreadystatechange=function(){
				if(xm.readyState==4){
					if(xm.status==200){
						delete self.ajone[k];
						if(f){
							if(typeof(f)=='string')A.$(f).innerHTML=xm.responseText;
							else{
								if(gs&&gs=='json'){
									eval('var _j='+xm.responseText);
									eval(f(_j))
								}
								else eval(f(xm.responseText))
							}
						}
					}
				}
			};
			xm.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
			xm.send(data)
		}
	}
	,wz:function(a){
		var y=a.offsetTop;
		var x=a.offsetLeft;
		e=a.offsetParent;
		while(e){
			y+=e.offsetTop;
			x+=e.offsetLeft;
			e=e.offsetParent
		};
		return{
			'y':y,'x':x
		}
	}
	,fnr:function(f){
		var s=[];
		for(var i=0,l=f.length;i<l;i++){
			if(f[i].name&&f[i].name!=''){
				switch(f[i].tagName.toLowerCase()){
					case'select':for(var a=0;a<f[i].length;a++){
						if(f[i][a].selected){
							s.push(f[i].name+'='+encodeURIComponent(f[i][a].value))
						}
					};
					break;
					default:switch(f[i].type.toLowerCase()){
						case'radio':var fo=f[f[i].name];
						for(var a=0;a<fo.length;a++){
							if(fo[a].checked){
								s.push(fo[a].name+'='+encodeURIComponent(fo[a].value));
								break
							}
						};
						i+=(fo.length-1);
						break;
						case'checkbox':if(f[i].checked){
							s.push(f[i].name+'='+encodeURIComponent(f[i].value))
						};
						break;
						default:s.push(f[i].name+'='+encodeURIComponent(f[i].value));
						break
					}
				}
			}
		};
		return s.join('&')
	}
	,fsnr:function(fs){
		var s=[];
		for(var i=0,l=fs.length;i<l;i++){
			if(typeof(fs[i])=='object'){
				s.push(this.fnr(fs[i]))
			}
			else{
				if(document.forms[fs[i]]){
					s.push(this.fnr(document.forms[fs[i]]))
				}
			}
		};
		return s.join('&')
	}
};
(function(w){
	var d=w.document;
	var ui=w.ui={};
	var m=false,zi=false;
	ui.alert=function(s,t,c){
		if(typeof(c)=='undefined'||c==true){
			new div({
				'c':true,'t':t
			})
		};
		new div({
			'c':true,'s':s,'css':'ui_alert','t':t
		})
	};
	ui.error=function(s,t,c){
		if(typeof(c)=='undefined'||c==true){
			new div({
				'c':true,'t':t
			})
		};
		new div({
			'c':true,'s':s,'css':'ui_error','t':t
		})
	};
	ui.success=function(s,t,c){
		if(typeof(c)=='undefined'||c==true){
			new div({
				'c':true,'t':t
			})
		};
		new div({
			'c':true,'s':s,'css':'ui_success','t':t
		})
	};
	ui.notice=function(s,t,c){
		if(typeof(c)=='undefined'||c==true){
			new div({
				'c':true,'t':t
			})
		};
		new div({
			'c':true,'s':s,'css':'ui_notice','t':t
		})
	};
	ui.confirm=function(s,f,c){
		if(c){
			m=new div({
				'c':false
			})
		}
		else{
			m=false
		};
		new div({
			'c':false,'s':s,'css':'ui_confirm','f':f
		})
	};
	ui.prompt=function(s,f,c){
		if(c){
			m=new div({
				'c':false
			})
		}
		else{
			m=false
		};
		new div({
			'c':false,'s':s,'css':'ui_prompt','f':f
		})
	};
	ui.box=function(title,obj,data,c,f,wh){
		if(c){
			m=new div({

				'c':false
			})
		}
		else{
			m=false
		};
		return zi=new div({
			'c':false,'title':title,'obj':obj,'css':'ui_box','data':data,'fun':f,'wh':wh
		})
	};
	ui.move=function(ob,yb,fd){
		function a(ob,yb,fd){
			var self=this;
			self.yb=yb;
			self.ob=ob;
			ob.onmousedown=function(e){
				var e=e||event;
				var w=A.wz(this);
				self.x=e.clientX-w.x;
				var tj=fd=='absolute'?document.body.scrollTop+document.documentElement.scrollTop:0;
				self.y=e.clientY+tj-w.y;
				self.yb.style.position=fd;
				try{
					e.preventDefault()
				}
				catch(o){
					e.returnValue=false
				};
				document.onmousemove=function(e){
					var e=e||event;
					var tj=fd=='absolute'?document.body.scrollTop+document.documentElement.scrollTop:0;
					self.yb.style.top=e.clientY+tj-self.y+'px';
					self.yb.style.left=e.clientX-self.x+'px'
				}
			};
			ob.onmouseup=function(){
				document.onmousemove='';
			}
		};
		if(typeof(ob)!='object'){
			ob=A.$(ob)
		};
		if(typeof(yb)=='string'){
			yb=A.$(yb)
		};
		new a(ob,yb||ob.parentNode,fd||'absolute')
	};
	var sp=document.getElementsByTagName('script');
	for(var i=0;i<sp.length;i++){
		if(sp[i].getAttribute('src') && sp[i].getAttribute('src').indexOf('yu.js') > -1){
			var PATH=sp[i].getAttribute('src').replace(/\/[^\/]*$/,'').replace(/(\/?)[^\/]*$/,'$1');
			break;
		}
	}
	function div(ob){
		this.cj=function(){
			this.G_d=d.createElement('div');
			with(this.G_d.style){
				position='absolute';
				zIndex=99;
				top='0px';
				left='0px';
				filter='alpha(opacity=0)';
				opacity=0;
				width=Math.max(d.documentElement.scrollWidth,d.documentElement.clientWidth)+'px';
				height=Math.max(d.documentElement.scrollHeight,d.documentElement.clientHeight)+'px';
				margin='0px';
				padding='0px';
				backgroundColor='#999999'
			};
			this.iecss='';
			d.body.appendChild(this.G_d);
			if(typeof(ob.css)=='string'){
				if(d.all&&ob.css!='ui_box'){
					this.iecss=' progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color="#CCCCCC",positive=1) progid:DXImageTransform.Microsoft.gradient(startColorstr="#FAFAFA", endColorstr="#E3E3E3")';
					if(ob.css=='ui_box'){
						this.iecss=' progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color="#CCCCCC",positive=1)'
					}
				};
				with(this.G_d.style){
					width='auto';
					height='auto';
					backgroundColor='transparent'
				};
				this.G_d.className=ob.css;
				if(ob.css=='ui_confirm'){
					this.G_d.innerHTML='<p class="ui_msg">'+ob.s+'</p><p class="ui_p"><input type="button" class="ui_button" value="确认" /><input type="button" class="ui_button ui_button_r" value="取消" /></p>';
					var ad=this.G_d.children[1];
					ad.children[0].G_d=this.G_d;
					ad.children[0].yc=this.yc;
					ad.children[0].f=ob.f;
					if(m){
						ad.children[0].c=m
					};
					ad.children[0].onclick=function(){
						this.yc(1);
						if(this.c){
							this.c.yc(0.5)
						};
						this.f(true)
					};
					ad.children[1].G_d=this.G_d;
					ad.children[1].yc=this.yc;
					ad.children[1].f=ob.f;
					if(m){
						ad.children[1].c=m
					};
					ad.children[1].onclick=function(){
						this.yc(1);
						if(this.c){
							this.c.yc(0.5)
						};
						this.f(false)
					}
				}
				else if(ob.css=='ui_prompt'){
					this.G_d.innerHTML='<p class="ui_p1">'+ob.s+'</p><p class="ui_p2"><input type="text" class="ui_text" /></p><p class="ui_p"><input type="button" class="ui_button" value="确认" /><input type="button" class="ui_button ui_button_r" value="取消" /></p>';
					var ad=this.G_d.children[2];
					ad.children[0].G_d=this.G_d;
					ad.children[0].yc=this.yc;
					ad.children[0].f=ob.f;
					if(m){
						ad.children[0].c=m
					};
					ad.children[0].onclick=function(){
						this.yc(1);
						if(this.c){
							this.c.yc(0.5)
						};
						this.f(this.parentNode.parentNode.children[1].children[0].value)
					};
					ad.children[1].G_d=this.G_d;
					ad.children[1].yc=this.yc;
					ad.children[1].f=ob.f;
					if(m){
						ad.children[1].c=m
					};
					ad.children[1].onclick=function(){
						this.yc(1);
						if(this.c){
							this.c.yc(0.5)
						};
						this.f(false)
					};
					this.G_d.children[1].children[0].focus();
				}
				else if(ob.css=='ui_box'){
					this.G_d.innerHTML='<div class="ui_box_title"><strong></strong></div><div class="ui_box_content"></div><span class="span"></span>';
					this.G_d.style.backgroundColor='#FFFFFF';
					var ad=this.G_d.children[0];
					ui.move(ad);
					var bd=this.G_d.children[1];
					ad.children[0].innerHTML=ob.title;
					this.G_d.children[2].G_d=this.G_d;
					this.G_d.children[2].yc=this.yc;
					if(m){
						this.G_d.children[2].c=m
					};
					this.G_d.children[2].onclick=function(){
						this.yc(1);
						if(this.c){
							this.c.yc(0.5)
						}
					};
					this.close=function(){
						this.G_d.children[2].onclick();
						try{delete this;}catch(e){};
					}
					if(typeof(ob.obj)=='object'){
						bd.innerHTML=ob.obj.innerHTML
					}
					else if(ob.obj.match(/(<[^>]+>)+/)){
						bd.innerHTML=ob.obj
					}
					else{
						bd.innerHTML='<img src="'+PATH+'images/ui_load.gif" alt="加载中" style="margin:10px 30px;" />';
						A.aj(ob.obj,ob.data||'',function(da){
							if(ob.fun){
								ob.fun(da,bd)
							}
							else{
								bd.innerHTML=da
							};
							zi.ct()
						})
					}
				}
				else{
					this.G_d.innerHTML='<p class="ui_msg">'+ob.s+'</p>'
				};
				this.ct(ob.wh)
			};
			this.xs(0.1)
		};
		this.ct=function(wh){
			var wh=wh||[false,false];
			this.G_d.style.top='0px';
			this.G_d.style.left='0px';
			var h=d.documentElement.clientHeight;
			var w=d.documentElement.clientWidth;
			if(wh[0]){
				with(this.G_d.children[1].style){
					width=wh[0]+'px';
					overflowX='hidden'
				}
			};
			if(wh[1]){
				with(this.G_d.children[1].style){
					height=wh[1]+'px';
					overflowX='hidden';
					overflowY='auto'
				}
			}
			else if(h-20<this.G_d.offsetHeight){
				with(this.G_d.children[1].style){
					height=h-20-39+'px';
					overflowX='hidden';
					overflowY='auto'
				}
			};
			this.G_d.style.top=(h-this.G_d.offsetHeight)/2+Math.max(d.documentElement.scrollTop,d.body.scrollTop)+'px';
			this.G_d.style.left=(w-this.G_d.offsetWidth)/2+Math.max(d.documentElement.scrollLeft,d.body.scrollLeft)+'px'
		};
		this.xs=function(i){
			var T=this;
			with(this.G_d.style){
				filter='alpha(opacity='+(i*100)+')'+this.iecss;
				opacity=i
			};
			if(d.all&&i>0.9&&ob.css=='ui_box'){
				this.G_d.style.filter=''
			};
			if(typeof(ob.css)=='string'){
				if(i<1){
					setTimeout(function(){
						T.xs(i+0.1)
					}
					,5)
				}
				else if(ob.c){
					setTimeout(function(){
						T.yc(1)
					}
					,ob.t||2000)
				}
			}
			else{
				if(i<0.3){
					setTimeout(function(){
						T.xs(i+0.2)
					}
					,5)
				}
				else if(ob.c){
					setTimeout(function(){
						T.yc(0.3)
					}
					,ob.t||2000)
				}
			}
		};
		this.yc=function(i){
			var T=this;
			with(this.G_d.style){
				filter='alpha(opacity='+(i*100)+')'+this.iecss;
				opacity=i
			};
			if(typeof(ob.css)=='string'){
				if(i>0){
					setTimeout(function(){
						T.yc(i-0.4)
					}
					,5)
				}
				else{
					d.body.removeChild(this.G_d)
				}
			}
			else{
				if(i>0){
					setTimeout(function(){
						T.yc(i-0.1)
					}
					,10)
				}
				else{
					d.body.removeChild(this.G_d)
				}
			}
		};
		this.cj()
	}
})(window);