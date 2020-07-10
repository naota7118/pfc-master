$(function() {
  $('#standard_weight').change(function() {
    console.log('weight');
  })

  var $input = $('#standard_weight');
  var $output = $('#standard_body');
  $input.on('input', function(event) {
    var value = $input.val();
    $output.text(value);
  })

});