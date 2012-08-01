// JavaScript Document

(function($) {
	$.fn.dishLists = function(tabList, options) {
		var defaults={
			currentTab:0,
			defaultClass:"hover",
			isAutoPlay:false,
			imageSwitch:false,
			stepTime:2000,
			switchingMode:"o"
		};
		var o = $.extend({}, defaults, options);
		var _isAutoPlay=o.isAutoPlay;
		var _stepTime=o.stepTime;
		var _switchingMode=o.switchingMode;
		var obj = $(this);
		var _tabList=obj.find(tabList);
		var ul=$(_tabList,obj);
		if(o.currentTab!=null){
			ul.eq(o.currentTab).addClass(o.defaultClass);
		}
        ul.each(function(i) {
			$(ul[i]).mouseover(function(){
				if(_switchingMode=="o"){
					$(this).click();
				}
				if(o.imageSwitch){
					imageSwitch($(this), "g_", "c_");	
				}
				_isAutoPlay=false;
			});
			$(ul[i]).mouseout(function(){
				if(o.imageSwitch){
					imageSwitch($(this), "c_", "g_");	
				}
				if(o.currentTab==null){
					$(this).removeClass(o.defaultClass);
				}
				_isAutoPlay=true;
			})
		})
		ul.each(function(i){
			$(ul[i]).click(function(){
				if($(this).className!=o.defaultClass){
					$(this).addClass(o.defaultClass).siblings().removeClass(o.defaultClass);
				}
			})
		});
		function selectMe(oo){
			if(oo!=null&&oo.html()!=null&&_isAutoPlay){
				oo.click();
			}
			if(oo.html()==null){
				selectMe(ul.eq(0));
			}else{
				window.setTimeout(selectMe,_stepTime,oo.next());
			}
		}
		function imageSwitch(obj, selectStr, replaceStr){
			var urlSrc=obj.find("img:eq(0)").attr("src").replace(selectStr, replaceStr);
			obj.find("img:eq(0)").attr("src",urlSrc);
		}
		function rtrim(s, v, r){
			return s.replace(v, r);
		}
		if(_isAutoPlay){
			selectMe(ul.eq(o.currentTab));
		}
		return this;
	};
	var __sti=setInterval;
	window.setInterval=function(callback,timeout,param){
		var args=Array.prototype.slice.call(arguments,2);
		var _cb=function(){
			callback.apply(null,args);
		}
		__sti(_cb,timeout);
	}
	var __sto=setTimeout;window.setTimeout=function(callback,timeout,param){
		var args=Array.prototype.slice.call(arguments,2);
		var _cb=function(){
			callback.apply(null,args);
		}
	__sto(_cb,timeout);
	}
})(jQuery);