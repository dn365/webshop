// JavaScript Document

(function($) {
	$.fn.movelist = function() {
		this.each(function(){
			var obj=$(this);
			obj.mousemove(function(){
				obj.addClass("hover");
				$(".menu-bd", this).show();
			}).mouseleave(function(){
				obj.removeClass("hover");
				$(".menu-bd", this).hide();
			})
		})
	}
	$.fn.moveShow=function(tMenu){
		var obj=$(this).find(tMenu);
		obj.each(function(){
			var _this=$(this).parent();
			$(this).mousemove(function(){
				$(this).parent().css("position","relative");
				_this.find(".info").show();
			});
			_this.find(".info").mouseleave(function(){
				$(this).hide();
				_this.removeAttr("style");
			});
		})
	}
})(jQuery);