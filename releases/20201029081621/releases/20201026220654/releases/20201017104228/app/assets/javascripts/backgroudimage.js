$(document).ready( function(){
  $('.bg-slider').bgSwitcher({
    images:['bg-image1.png', 'bg-image2.png', 'bg-image3.png'],
    interval: 3000,
    shuffle: true,
    effect: "fade",
    duration: 1000,
    easing: "swing"
  });
});