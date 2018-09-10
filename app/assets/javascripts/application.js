//= require jquery3
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function () {
  setInterval(function () {
    $('.clock').load('/users/display_time');
  }, 1000);
});
