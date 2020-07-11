$(function() {

  var $standard_weight = $('#standard_weight');
  var $leanBodyMass = $('#standard_leanBodyMass');
  var $calorie = $('#calorie');

  $standard_weight.on('input', function(event) {
    var standard_weight = $standard_weight.val();
    var standard_weight = Number(standard_weight);
    var $standard_bodyFatPercentage = $('#standard_bodyFatPercentage');

    var standard_bodyFatPercentage = $standard_bodyFatPercentage.val();
      var standard_bodyFatPercentage = Number(standard_bodyFatPercentage);
      var division_bodyFatPercentage = standard_bodyFatPercentage/100
      var difference_bodyFatPercentage = 1-division_bodyFatPercentage
      var leanBodyMass = standard_weight * difference_bodyFatPercentage
      var mathLeanBodyMass = Math.round(leanBodyMass)
      var calorie = leanBodyMass*40
      var mathCalorie = Math.round(calorie)
      $('#standard_leanBodyMass').val(mathLeanBodyMass);
      $leanBodyMass.text(mathLeanBodyMass);
      $('#standard_calorie').val(mathCalorie);
      $calorie.text(mathCalorie);

      var $protein = $('#protein');
      var protein = leanBodyMass * 2.5
      var mathProtein = Math.round(protein)
      $('#standard_protein').val(mathProtein);
      $protein.text(mathProtein);

      var $fat = $('#fat');
      var fat = calorie * 0.2 / 9
      var mathFat = Math.round(fat)
      $('#standard_fat').val(mathFat);
      $fat.text(mathFat);

      var proteinCalorie = protein * 4
      var fatCalorie = calorie * 0.2
      var $carbo = $('#carbo');
      var carbo = (calorie - proteinCalorie - fatCalorie) / 4
      var mathCarbo = Math.round(carbo)
      $('#standard_carbo').val(mathCarbo);
      $carbo.text(mathCarbo);
      
    $standard_bodyFatPercentage.on('input', function(event) {
      var standard_bodyFatPercentage = $standard_bodyFatPercentage.val();
      var standard_bodyFatPercentage = Number(standard_bodyFatPercentage);
      var division_bodyFatPercentage = standard_bodyFatPercentage/100
      var difference_bodyFatPercentage = 1-division_bodyFatPercentage
      var leanBodyMass = standard_weight * difference_bodyFatPercentage
      var mathLeanBodyMass = Math.round(leanBodyMass)
      var calorie = leanBodyMass*40
      var mathCalorie = Math.round(calorie)
      $('#standard_leanBodyMass').val(mathLeanBodyMass);
      $leanBodyMass.text(mathLeanBodyMass);
      $('#standard_calorie').val(mathCalorie);
      $calorie.text(mathCalorie);

      var $protein = $('#protein');
      var protein = leanBodyMass * 2.5
      var mathProtein = Math.round(protein)
      $('#standard_protein').val(mathProtein);
      $protein.text(mathProtein);

      var $fat = $('#fat');
      var fat = calorie * 0.2 / 9
      var mathFat = Math.round(fat)
      $('#standard_fat').val(mathFat);
      $fat.text(mathFat);

      var proteinCalorie = protein * 4
      var fatCalorie = calorie * 0.2
      var $carbo = $('#carbo');
      var carbo = (calorie - proteinCalorie - fatCalorie) / 4
      var mathCarbo = Math.round(carbo)
      $('#standard_carbo').val(mathCarbo);
      $carbo.text(mathCarbo);
    })
  })

});