$(function() {
  $('#standard_weight').change(function() {
    console.log('weight');
  })

  var $standard_weight = $('#standard_weight');
  var $leanBodyMass = $('#leanBodyMass');
  var $standard_calorie = $('#standard_calorie');
  $standard_weight.on('input', function(event) {
    var standard_weight = $standard_weight.val();
    var standard_weight = Number(standard_weight);
    // var leanBodyMass = standard_weight*0.8
    // var standard_calorie = standard_weight*32
    // $leanBodyMass.text(leanBodyMass);
    // $standard_calorie.text(standard_calorie);
    var $standard_bodyFatPercentage = $('#standard_bodyFatPercentage');
    $standard_bodyFatPercentage.on('input', function(event) {
      var standard_bodyFatPercentage = $standard_bodyFatPercentage.val();
      var standard_bodyFatPercentage = Number(standard_bodyFatPercentage);
      var division_bodyFatPercentage = standard_bodyFatPercentage/100
      var difference_bodyFatPercentage = 1-division_bodyFatPercentage
      var leanBodyMass = standard_weight * difference_bodyFatPercentage
      var standard_calorie = leanBodyMass*40
      $leanBodyMass.text(leanBodyMass);
      $standard_calorie.text(standard_calorie);
    })
  })

});