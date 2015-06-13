$(document).ready(function(){
	$(".slider").each(function(){
		$(this).slider();
	});
	
	jQuery(".slider").on("swipeleft", function(e){
		alert("Hi");
	});
	
	$(document).keyup(function(e){
		if (e.which == 37) {
			sliderPrev($(".slider.isActive"));
		}
		
		else if (e.which == 39) {
			sliderNext($(".slider.isActive"));
		}
	});
	
	$(document).bind("fullscreenchange", function() {
		$(".slider .action.full").html(($(document).fullScreen() ? "thoát" : "toàn màn hình"));
	});
});


function sliderNext(slider) {
	var slides = slider.children(".slides");
	var active = slider.children(".slides").children(".active");
	var index = slides.children(".slide").index(active);
	
	if (active.next(".slide").length) {
		slider.slide(index + 1);
	}
}

function sliderPrev(slider) {
	var slides = slider.children(".slides");
	var active = slider.children(".slides").children(".active");
	var index = slides.children(".slide").index(active);
	
	if (active.prev(".slide").length) {
		slider.slide(index - 1);
	}
}

jQuery.fn.slider = function(elem) { 
	var controls = '<div class="controls"><a class="prev">&lt;</a><a class="next">&gt;</a></div>';
	var caption = '<span class="caption"><span class="text"></span><a class="full action">toàn màn hình</a></span>';
	var ind = '<span class="indicators"></span>';
	$(this).html("<div class=\"slides\">" + $(this).html() + "</div>" + controls + caption + ind);
	
	$(this).children(".slides").children(".slide").first().addClass("active");
	$(this).children(".caption").children(".text").html($(this).children(".slides").children(".active").attr("data-caption"));
	
	$(this).children(".slides").children(".slide").first().addClass("active");
	$(this).children(".caption").children(".text").html($(this).children(".slides").children(".active").attr("data-caption"));
		
	$(this).children(".slides").children(".slide").each(function(index){
		if ($(this).attr("data-caption") == null) {
			$(this).attr("data-caption", "");
		}
		
		$(this).parent().parent().children(".indicators").append("<span class=\"indicator\" data-slide=\"" + index + "\"></span>");
	});
	
	$(this).children(".indicators").children(".indicator").first().addClass("active");
	
	$(this).children(".controls").children(".next").on("click", function() {
		sliderNext($(this).parent().parent());
	});
	
	
	$(this).children(".controls").children(".prev").click(function() {
		sliderPrev($(this).parent().parent());
	});
	
	$(this).children(".caption").children(".action.full").click(function() {
		$(this).parent().parent().toggleFullScreen(true);
		//$(this).html(($(document).fullScreen() ? "toàn màn hình" : "thoát"));
	});
	
	$(this).children(".indicators").children(".indicator").click(function() {
		var index = $(this).parent().children(".indicator").index( $(this) );
		$(this).parent().parent().slide(index);
	});
	
	$(this).click(function(){
		$(".slider").removeClass("isActive");
		$(this).addClass("isActive");
	});
	
	return this; 
};


jQuery.fn.slide = function(index) {
	$(this).find(".slides .slide").removeClass("active");
	$(this).children(".slides").children(".slide").eq(index).addClass("active");
	
	$(this).children(".indicators").children(".indicator").removeClass("active");
	$(this).children(".indicators").children(".indicator").eq(index).addClass("active");
	
	$(this).children(".caption").children(".text").html($(this).children(".slides").children(".active").attr("data-caption"));
	console.log("Showing slide " + index);
}

function d(c){var b,a;if(!this.length)return this;b=this[0];b.ownerDocument?a=b.ownerDocument:(a=b,b=a.documentElement);if(null==c){if(!a.exitFullscreen&&!a.webkitExitFullscreen&&!a.webkitCancelFullScreen&&!a.msExitFullscreen&&!a.mozCancelFullScreen)return null;c=!!a.fullscreenElement||!!a.msFullscreenElement||!!a.webkitIsFullScreen||!!a.mozFullScreen;return!c?c:a.fullscreenElement||a.webkitFullscreenElement||a.webkitCurrentFullScreenElement||a.msFullscreenElement||a.mozFullScreenElement||c}c?(c=
b.requestFullscreen||b.webkitRequestFullscreen||b.webkitRequestFullScreen||b.msRequestFullscreen||b.mozRequestFullScreen)&&c.call(b):(c=a.exitFullscreen||a.webkitExitFullscreen||a.webkitCancelFullScreen||a.msExitFullscreen||a.mozCancelFullScreen)&&c.call(a);return this}jQuery.fn.fullScreen=d;jQuery.fn.toggleFullScreen=function(){return d.call(this,!d.call(this))};var e,f,g;e=document;
e.webkitCancelFullScreen?(f="webkitfullscreenchange",g="webkitfullscreenerror"):e.msExitFullscreen?(f="MSFullscreenChange",g="MSFullscreenError"):e.mozCancelFullScreen?(f="mozfullscreenchange",g="mozfullscreenerror"):(f="fullscreenchange",g="fullscreenerror");jQuery(document).bind(f,function(){jQuery(document).trigger(new jQuery.Event("fullscreenchange"))});jQuery(document).bind(g,function(){jQuery(document).trigger(new jQuery.Event("fullscreenerror"))});