$(document).ready(function() {

$( ".recent_tweets_form" ).on( "submit", function( event ) {
  event.preventDefault();
  $("#user_tweets").html("<img src='img/loading.gif'/>");
  var button = $(this).children().find("#recent_tweets_btn")
  button.val("Just a sec!");
  button.attr("disabled",true);

  $.ajax({
  	url: $(this).attr("action"),
  	method: $(this).attr("method"),
  	data: $(this).serialize()
  }).done(function(response){
  	  console.log(response);
  	  $("#user_tweets").children("img").remove();
      $("#user_tweets").append(response);
      button.val("Get Recent Tweets!");
      button.attr("disabled",false);
  	});
  });





// $("#recent_tweets_btn").submit(function(event){
// event.preventDefault();
// console.log("hi");
// });

// $('body').on('click', "#recent_tweets_btn", function(event){
// event.preventDefault();
// console.log("hi");
// $(this).val("Just a sec!");
// $(this).attr("disabled", "true");
// });

// $.ajax({
//     url:"/recent_tweets",
//     type:"GET",
//     data: params,
//     beforeSend: function() {
//         alert("loading")
//     },
//     success:function(html){ alert(html) }
// });

});
