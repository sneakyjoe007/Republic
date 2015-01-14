// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require maskedinput
//= require bootstrap
//= require turbolinks
//= require moment
//= require bootstrap-datepicker/core
//= require bootstrap-datetimepicker
//= require recurring_select
//= require_tree .

$(function () {
	$("#search-form input").keyup(function() {
		$.get($("#search-form").attr("action"), $("#search-form").serialize(), null, "script");
		return false;
	});

	$("[type=checkbox]").change(function() {
        $.get($("#search-form").attr("action"), $("#search-form").serialize(), null, "script");
        return false
    });

	$("#EIN").change(function() {
    	$(this).addClass("has-success has-feedback");
    	$("#success").addClass("glyphicon glyphicon-ok form-control-feedback");
    	var str = $("#TIN").val();
 		//$.ajax({
 		//	url: "guideStar",
 		//	data: {'EIN': str}
 		//});
 	});

 	
});
