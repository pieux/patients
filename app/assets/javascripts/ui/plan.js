$(document).ready(function(){

  // fullfill template - ache-tr-plans
  $.getJSON('/ui/all_plans', function(result){
    var data = {"plans":[]};
    data["plans"] = result;
    // templates in script blocks
    var templ = $('#must-tr-plans').html();
    var  html = Mustache.to_html(templ, data);
    $('#ache-tr-plans').html(html);
  });

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
  });

});

