$(document).ready(function(){

  $('#plan-form').submit(function(){
    var data = { content: $('#plan-content').val() };
    $.ajax({
      url: '/ui/create_plan',
      type: 'POST',
      dataType: 'json',
      data: data,
      success: function (result) {
        alert(result.content);
      },
    });
    return false;
  })
});

