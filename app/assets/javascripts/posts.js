// $(function(){

//   function buildHTML(post) {
//     var html = `<div class="post">
//                   <div class="post-box">
//                     <div class="upper-post">
//                       <div class="upper-post__user-name">
//                         <a href="/users/${post.user_id}">${post.user_name}
//                         </a>
//                       </div>
//                       <div class="upper-post__date">
//                         <time datetime>${post.created_at}</time>
//                       </div>
//                     </div>
//                     <div class="lower-post">
//                       <table>
//                         <thead>
//                           <tr>
//                             <th>FOOD</th>
//                             <th>Calorie</th>
//                           </tr>
//                         </thead>
//                         <tbody>
//                           <tr>
//                             <td>
//                             ${post.food}
//                             </td>
//                             <td>
//                             ${post.calorie}
//                             </td>
//                           </tr>
//                         </tbody>
//                       </table>
//                       <table>
//                         <thead>
//                           <tr>
//                             <th>P</th>
//                             <th>F</th>
//                             <th>C</th>
//                           </tr>
//                         </thead>
//                         <tbody>
//                           <tr>
//                             <td>
//                             ${post.protein}
//                             </td>
//                             <td>
//                             ${post.fat}
//                             </td>
//                             <td>
//                             ${post.carbo}
//                             </td>
//                           </tr>
//                         </tbody>
//                       </table>
//                       <table>
//                         <tbody>
//                           <tr>
//                             <td>
//                             ${post.text}
//                             </td>
//                           </tr>
//                         </tbody>
//                       </table>
//                       <ul class="more_list">
//                         <li>
//                           <a data-method="get" href="/posts/${post.id}">詳細</a>
//                         </li>
//                         <li>
//                           <a data-method="get" href="/posts/${post.id}/edit">編集</a>
//                         </li>
//                         <li>
//                           <a rel="nofollow" data-method="delete" href="/posts/${post.id}"><i class="fa fa-trash"></i></a>
//                         </li>
//                         <li>
//                           <a href="https://twitter.com/"><i class="fa fa-twitter"></i></a>
//                         </li>
//                         <li>
//                           <a href="#"><i class="fa fa-heart-o"></i></a>
//                         </li>
//                         <li>
//                           <a href="#"><i class="fa fa-comment-o"></i></a>
//                         </li>
//                       </ul>
//                     </div>
//                   </div>
//                 </div>`
//     return html;
//   }

//   $('#new_post').on('submit', function(e){
//     e.preventDefault()
//     console.log('hoge');
//     var formData = new FormData(this);
//     // action属性の値を取得 →/posts
//     var url = $(this).attr('action');
//     $.ajax({
//       url: url,
//       type: 'POST',
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//     .done(function(data){
//       var html = buildHTML(data);
//       $('.posts').prepend(html);

//       // $('.posts').animate({ scrollTop: $('.posts')[0].scrollHeight});
//       $('form')[0].reset();
//       $(".post-btn").prop("disabled", false);
//       console.log(html);
//     })
//     .fail(function(){
//       alert('投稿できませんでした');
//     })
//   });
// });