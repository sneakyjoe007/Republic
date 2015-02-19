$(document).ready(function () {

  $("#TIN").mask("99-9999999", {
    placeholder: " "
  });

  $("#volunteers").on("click", function(){
 		$( "#userEvents" ).load( "organizations/volunteers.html #userEvents");
 	});


});
