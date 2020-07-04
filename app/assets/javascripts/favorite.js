$(function(){
  
  function buildHTML(){
    var html = `<form class="button_to" method="post" action="/posts/21/likes/21">
                  <input type="hidden" name="_method" value="delete">
                  <input type="submit" value="いいねを取り消す">
                  <input type="hidden" name="authenticity_token" value="UvQ++DpAnTnzOzUfo8aJgIoezBCtRzo4KAYh0IsUXftYw0AmHcH8DY+fgOeJqbuFsI2EwP9lXicWlP9rsyAtpQ==">
                </form>`
    return html;
  }

  $('.button_to').on('submit', function(e) {

    e.preventDefault();
    if($('.button_to').children().is('#like')) {
      console.log('like');
    } else {
      console.log('dislike');
      alert('エラー');
    }
    // var formData = new FormData(this);
    // var url = $(this).attr('action');
    // $.ajax({
    //   url: url,
    //   type: "POST",
    //   data: formData,
    //   dataType: 'json',
    //   processData: false,
    //   contentType: false
    // })
    // .done(function(data){
    //   var html = buildHTML(data);
    //   $('.comments').prepend(html);
    //   $('#comment_comment').val('');
    //   $('#commentBtn').prop('disabled', false);
    // })
    // .fail(function(){
    //   alert('エラー');
    // })
  })
})