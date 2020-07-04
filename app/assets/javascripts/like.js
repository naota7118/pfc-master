// $(function(){
  
//   function buildHTML(like){
//     var html = `<form class="button_to" method="post" action="/posts/${like.post_id}/likes/${like.id}">
//                   <input type="hidden" name="_method" value="delete">
//                   <input type="submit" value="いいねを取り消す">
//                 </form>`
//     return html;
//   }

//   $('.button_to').on('submit', function(e) {
//     e.preventDefault();
//     if($('.button_to').children().is('#like')) {
//       console.log(this);
//       var formData = new FormData(this);
//       var url = $(this).attr('action')
//       console.log(url);
//       $.ajax({
//         url: url,
//         type: "POST",
//         data: formData,
//         dataType: 'json',
//         processData: false,
//         contentType: false
//       }) 
//       .done(function(data){
//         console.log('data');
//         $('.button_to').remove();
//         var html = buildHTML(data);
//         $('.like').append(html);
//         // $('.form__submit').prop('disabled', false);
//       })
//       .fail(function(){
//         alert('エラー');
//       })
//     } else {
//       console.log('dislike');
//       alert('エラー');
//     }
//   })
// })