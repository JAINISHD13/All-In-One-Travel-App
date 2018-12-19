$('.toggle').on('click', function() {
  $('.container2').stop().addClass('active');
});

$('.close').on('click', function() {
  $('.container2 ').stop().removeClass('active');
});