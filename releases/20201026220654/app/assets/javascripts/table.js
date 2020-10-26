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
                    <i class="fa fa-2x fa-plus-circle plus-button"></i>
                  </td>
                  <td class="icon-minus">
                    <i class="fa fa-2x fa-minus-circle minus-button"></i>
                  </td>
                </tr>`
    return html;
  }

  $(document).on('click', '.plus-button', function() {
    var html = buildHTML();
    $('.table-body').append(html);
  })

  $(document).on('click', '.minus-button', function() {
    // テーブルの行を数える
    var count = $('.table-line tr').length;
    // 1行しかない時は消せない
    if (count > 1) {
      $('.table-line tr:last-child').remove();
    }
  })
  
  
});