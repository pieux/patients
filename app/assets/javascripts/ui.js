# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function(){

  $.post('ui/create_plan',
    { content: $('#plan-content').val() },
    function (data, textStatus, jqXHR) {
      alert(data.content);
    }
  );
  return false;

});
