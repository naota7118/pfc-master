$(function(){
  
  function buildHTML(like){
    var html = `<form class="button_to" method="post" action="/posts/${like.post_id}/likes/${like.id}">
                  <input type="hidden" name="_method" value="delete">
                  <input type="submit" value="いいねを取り消す" id="delete">
                </form>
                <div class="likeCounts">
                  いいね数：
                  ${like.counts}
                </div>`
    return html;
  }

  function buildDeleteHTML(like){
    var html = `<form class="button_to" method="post" action="/posts/${like.post_id}/likes">
                  <input type="hidden" name="_method" value="post">
                  <input type="submit" value="いいね" id="like">
                </form>
                <div class="likeCounts">
                  いいね数：
                  ${like.counts}
                </div>`
    return html;
  }
  
  $('.button_to').on('submit', function(e) {
    e.preventDefault();
    $.ajaxSetup({
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
        console.log('aaaaa');
      }
    });
    // $.ajaxPrefilter(function(options, originalOptions, jqXHR) {
    //   var token;
    //   if (!options.crossDomain) {
    //     token = $('meta[name="csrf-token"]').attr('content');
    //     if (token) {
    //       return jqXHR.setRequestHeader('X-CSRF-Token', token);
    //     }
    //   }
    // });
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
        $('.button_to').prop('disabled', false);
      })
      .fail(function(){
        alert('エラー');
      })
    } else {
      var formData = new FormData(this);
      console.log(this);
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
        $('.button_to').remove();
        $('.likeCounts').remove();
        var html = buildDeleteHTML(data);
        $('.like').append(html);
        $('.button_to').prop('disabled', false);
      })
      .fail(function(){
        alert('エラー');
      })
    }
  })
})