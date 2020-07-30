$(function(){

  function buildHTML(){
    var html = `<tr>
                  <td>
                    <input type="text" name="post[food]" id="post_food">
                  </td>
                  <td>
                    <input type="number" name="post[calorie]" id="post_calorie">
                  </td>
                  <td>
                    <input type="number" name="post[protein]" id="post_protein">
                  </td>
                  <td>
                    <input type="number" name="post[fat]" id="post_fat">
                  </td>
                  <td>
                    <input type="number" name="post[carbo]" id="post_carbo">
                  </td>
                  <td class="icon-plus">
                    <i class="fa fa-2x fa-plus-circle table-button"></i>
                  </td>
                  <td class="icon-minus">
                    <i class="fa fa-2x fa-minus-circle table-button"></i>
                  </td>
                </tr>`
    return html;
  }

  $('.plus-button').click(function() {
    console.log('hello');
    var html = buildHTML();
    $('.table-body').append(html);
  })

  $('.minus-button').click(function() {
    console.log('hoge');
    $('.table-body tr:last').remove();
  })
});