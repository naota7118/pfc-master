$(function() {
  $(function() {
    $(document).on('change', '.image_upload', function() {
      //選択したfileのオブジェクトを取得
      var file = this.files[0];
      //FileReaderオブジェクトの生成
      var reader = new FileReader(); 
      //readAsDataURLで指定したFileオブジェクトを読み込む
      var hoge = reader.readAsDataURL(file); 
      console.log(hoge);
    })
  });
});