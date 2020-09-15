$(function(){
  function buildHTML(comment){
    var html = `<div class="comment">
                  <div class="commentUser">
                    ${comment.user_name}
                  </div>
                  <div class="commentContent">
                  ${comment.comment}
                  </div>
		  <div class="commentTime">
                    <time datetime="${comment.created_at}">${comment.created_at}</time>
                  </div>
		</div>`;
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').prepend(html);
      $('#comment_comment').val('');
      $('#commentBtn').prop('disabled', false);
    })
    .fail(function(){
      alert('エラー');
    })
  })
});
