# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#timepicker").datetimepicker
   pickDate: false

$ ->
  $("#datepicker").datetimepicker
    pickTime: false
    minDate: new Date()

$ ->
 $("#begin-date").datepicker
   startDate: "0D"
   format: "yyyy-mm-dd"
