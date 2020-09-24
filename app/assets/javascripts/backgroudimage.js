$(document).ready( function(){
  // ページ読み込み時に実行したい処理
  $('.bg-slider').bgSwitcher({
    images:['bg-image1.png', 'bg-image2.png', 'bg-image3.png'],
    interval: 3000, // 背景画像を切り替える間隔を指定 3000=3秒
    loop: true, // 切り替えを繰り返すか指定 true=繰り返す　false=繰り返さない
    shuffle: true, // 背景画像の順番をシャッフルするか指定 true=する　false=しない
    effect: "fade", // エフェクトの種類をfade,blind,clip,slide,drop,hideから指定
    duration: 1000, // エフェクトの時間を指定します。
    easing: "swing" // エフェクトのイージングをlinear,swingから指定
  });
});