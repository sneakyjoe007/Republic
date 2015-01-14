$(function () {
	$("#profiledatepicker").datepicker({
  	  startDate: "0D"
 	 }).on('changeDate', function(e){
 	 	var sd1 = $(this).val(e.format('yyyy-mm-dd'))
 	 	console.log(sd1);
 	 	console.log(sd1.context.value);
 	 	$("#userEvents").load( "users/search.html?event_date=" + sd1.context.value);
 	 });
	//$("#profiledatepicker").on("changeDate", function(e){
		//var sd1 = $(this).datepicker("getDate");
	//	e.format = "mm/dd/yyyy"
	//	console.log(e);
	//	console.log(e.month);
	//	console.log($('#profiledatepicker').datepicker('getDate'));
	//});


	$("#mine").on("click", function(){
 		$("#mine").addClass("red-text");
 		$( "#userEvents" ).load( "users/events.html #userEvents");
 	});

 	$("#friends").on("click", function(){
 		$("#friends").addClass("red-text");
 		$( "#userEvents" ).load( "users/friends.html #userEvents");
 	});
});