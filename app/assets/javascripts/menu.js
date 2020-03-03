$(function() {
  let show = $('#show');
  let menu = $('.menu');

  show.on('click', function() {
    menu.slideToggle(200);
  });
});