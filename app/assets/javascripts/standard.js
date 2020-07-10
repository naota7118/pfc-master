$(function() {
  $('#standard_weight').change(function() {
    console.log('weight');
  })

  var $standard_weight = $('#standard_weight');
  var $leanBodyMass = $('#leanBodyMass');
  var $calorie = $('#calorie');
  $standard_weight.on('input', function(event) {
    var standard_weight = $standard_weight.val();
    var standard_weight = Number(standard_weight);
    var $standard_bodyFatPercentage = $('#standard_bodyFatPercentage');
    $standard_bodyFatPercentage.on('input', function(event) {
      var standard_bodyFatPercentage = $standard_bodyFatPercentage.val();
      var standard_bodyFatPercentage = Number(standard_bodyFatPercentage);
      var division_bodyFatPercentage = standard_bodyFatPercentage/100
      var difference_bodyFatPercentage = 1-division_bodyFatPercentage
      var leanBodyMass = standard_weight * difference_bodyFatPercentage
      var calorie = leanBodyMass*40
      $leanBodyMass.text(leanBodyMass);
      $calorie.text(calorie);

      var $protein = $('#protein');
      var protein = leanBodyMass * 2.5
      $protein.text(protein);

      var $fat = $('#fat');
      var fat = calorie * 0.2 / 9
      $fat.text(fat);

      var proteinCalorie = protein * 4
      var fatCalorie = calorie * 0.2
      var $carbo = $('#carbo');
      var carbo = (calorie - proteinCalorie - fatCalorie) / 4
      $carbo.text(carbo);
    })
  })

});