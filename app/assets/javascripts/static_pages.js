//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){ // Document Ready

  $('#easter-icon').click(function(){
    $('#hidden-easter-link').click();
  });

  $('#jquery-ajax-button').click(function(){
    $.post(
      '/easter_egg', 
      {name: 'carlos', email: 'carlos@devpointlabs.com'},
      function(data, textStatus){
        console.log('The text status is:' + textStatus);
        console.log(data);
      },
      'text'
    );
  });
});
