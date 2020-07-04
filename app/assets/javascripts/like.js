$(function(){
  
  function buildHTML(like){
    var html = `<form class="button_to" method="post" action="/posts/${like.post_id}/likes/${like.id}">
                  <input type="hidden" name="_method" value="delete">
                  <input type="submit" value="いいねを取り消す">
                </form>
                <div class="likeCounts">
                  いいね数：
                  ${like.counts}
                </div>`
    return html;
  }

  function buildDeleteHTML(like){
    var html = `<form class="button_to" method="post" action="/posts/${like.post_id}/likes">
                  <input id="like" type="submit" value="いいね">
                  <input type="hidden" name="authenticity_token" value="">
                </form>`
    return html;
  }

  $('.button_to').on('submit', function(e) {
    e.preventDefault();
    if($('.button_to').children().is('#like')) {
      var formData = new FormData(this);
      var url = $(this).attr('action')
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      }) 
      .done(function(data){
        $('.button_to').remove();
        $('.likeCounts').remove();
        var html = buildHTML(data);
        $('.like').append(html);
        console.log('good');
        // $('.form__submit').prop('disabled', false);
      })
      .fail(function(){
        alert('エラー');
      })
    } else {
      var formData = new FormData(this);
      var url = $(this).attr('action')
      $.ajax({
        url: url,
        type: "DELETE",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      }) 
      .done(function(data){
        console.log('data');
        $('.button_to').remove();
        var html = buildDeleteHTML(data);
        $('.like').append(html);
        // $('.form__submit').prop('disabled', false);
      })
      .fail(function(){
        alert('エラー');
      })
    }
  })
})