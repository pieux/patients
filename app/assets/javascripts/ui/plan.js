$(document).ready(function(){

  // ++++++++++++++++ view layer ++++++++++++++++
  templ_tr_plans(); // fullfill template - ache-tr-plans
  // ++++++++++++++++ end of view layer ++++++++++++++++

  // ++++++++++++++++ data layer ++++++++++++++++
  plan_form_submit(); // create new plan

  $('.delete-plan').live('click', delete_plan); // delete plan via ID
  // ++++++++++++++++ end of data layer ++++++++++++++++

});


// Below is a bunch of functions

// ++++++++++++++++ view layer ++++++++++++++++

// fullfill template - ache-tr-plans
function templ_tr_plans()
{
  $.getJSON('/ui/all_plans', function(result){
    var data = {"plans":[]};
    data["plans"] = result;
    // templates in script blocks
    var templ = $('#must-tr-plans').html();
    var  html = Mustache.to_html(templ, data);
    $('#ache-tr-plans').html(html);
  });

}
// ++++++++++++++++ end of view layer ++++++++++++++++

// ++++++++++++++++ data layer ++++++++++++++++

function plan_form_submit(){
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
}

function delete_plan(e)
{
  e.preventDefault();
  var parent = $(this).closest("tr");
  $.get('/ui/delete_plan',
    {"id": parent.attr("id").replace('plan-','')},
    function () {
      parent.fadeOut("fast",function(){
        parent.remove();
      });
    }
  );
  return false;
}

// ++++++++++++++++ end of data layer ++++++++++++++++
