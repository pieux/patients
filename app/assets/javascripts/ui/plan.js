$(document).ready(function(){

  // ++++++++++++++++ view layer ++++++++++++++++
  templ_tbody_plans(); // fullfill template - ache-tr-plans

  // ++++++++++++++++ end of view layer ++++++++++++++++


  // ++++++++++++++++ data layer ++++++++++++++++
  plan_form(); // create new plan

  $('.delete-plan').live('click', delete_plan); // delete plan via ID

  $('.launch-update-plan').live('click', launch_update_plan);

  //update_plan_form();
  // ++++++++++++++++ end of data layer ++++++++++++++++

});


// Below is a bunch of functions

// ++++++++++++++++ view layer ++++++++++++++++

// fullfill template - ache-tbody-plans
function templ_tbody_plans(){
  $.getJSON('/ui/all_plans', function(result){
    var data = {"plans":[]};
    data["plans"] = result;
    // templates in script blocks
    var templ = $('#must-tbody-plans').html();
    var html = Mustache.to_html(templ, data);
    $('#ache-tbody-plans').html(html);
  });

}
// ++++++++++++++++ end of view layer ++++++++++++++++

// ++++++++++++++++ data layer ++++++++++++++++

function plan_form(){
  $('#plan-form').submit(function(e){
    e.preventDefault();
    var params = { content: $('#plan-content').val() };
    $.ajax({
      url: '/ui/create_plan',
      type: 'POST',
      dataType: 'json',
      data: params,
      success: function (result) {
        // templates in script blocks
        var templ =$('#must-tr-plan').html();
        var html = Mustache.to_html(templ, result);
        $(html).hide().appendTo($('#ache-tbody-plans:last')).fadeIn();
      },
    });
    return false;
  });
}

function delete_plan(e){
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

function launch_update_plan(e){
  e.preventDefault();
  var tr_plan = $(this).closest("tr");
  var data = {
                "id": tr_plan.attr("id").replace('plan-',''),
                "content":"我想修改计划，可以吗?"
             };

  var templ =$('#must-form-update-plan').html();
  var html = Mustache.to_html(templ, data);
  $('#ache-form-update-plan').html(html);
  $('#updateModal').modal('show');
}

//function update_plan_form(){
  //$('#update-plan-form').submit(function(e){
    //e.preventDefault();
    //var params = {
      //id: $('#update-plan-id').val(),
      //content: $('#update-plan-content').val()
    //};
    //$.ajax({
      //url: '/ui/update_plan',
      //type: 'POST',
      //dataType: 'json',
      //data: params,
      //success: function (result) {
         //templates in script blocks
        //var templ =$('#must-tr-plan').html();
        //var html = Mustache.to_html(templ, result);
        //$(html).hide().appendTo($('#ache-tbody-plans:last')).fadeIn();
        //$('#plan-'+result.id).replace(html);
      //},
    //});
    //return false;
  //});
//}
// ++++++++++++++++ end of data layer ++++++++++++++++
