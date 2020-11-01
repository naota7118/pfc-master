// $(function() {
//   var pagetop = $('#page_top');
//   pagetop.hide();

//   $(window).scroll(function () {

//     if ($(this).scrollTop(100)) {  //100pxスクロールしたら表示
//           console.log('200');
//           pagetop.fadeIn();
//       } else {
//           pagetop.fadeOut();
//       }
//   });

//   pagetop.click(function () {
//     event.preventDefault();
//     console.log('100');
//       $('html, body').animate({scrollTop: 0}); //0.5秒かけてトップへ移動
//       return false;
//   });

// });