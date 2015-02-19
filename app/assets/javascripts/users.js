$(document).ready(function () {
	$("#profiledatepicker").datepicker({
  	  startDate: "0D"
 	 }).on('changeDate', function(e){
 	 	var sd1 = $(this).val(e.format('yyyy-mm-dd'))
 	 	$("#userEvents").load( "users/search.html?event_date=" + sd1.context.value);
 	 });


	$("#mine").on("click", function(){
 		$( "#userEvents" ).load( "users/events.html #userEvents");
 	});

 	$("#friends").on("click", function(){
 		$( "#userEvents" ).load( "users/friends.html #userEvents");
 	});

 	$(".panel-body").on("click", function(){
 		$(this).parent().next("#myModal").modal('toggle');
 	});
});