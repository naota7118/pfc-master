$(function() {
  $('#standard_weight').change(function() {
    console.log('weight');
  })

  var $input = $('#standard_weight');
  var $output = $('#yourleanBodyMass');
  $input.on('input', function(event) {
    var value = $input.val();
    var result = Number(value);
    var multi = result*0.8
    $output.text(multi);
  })


});