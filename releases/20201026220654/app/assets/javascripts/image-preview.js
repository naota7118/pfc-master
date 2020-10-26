$(function() {
  $(function() {

    // プレビューHTML生成
    function buildHTML() {
      var html = `<div class="preview-box">
                    <div class="upper-box">
                      <img src="" alt="preview" class="upload-image" height="100px" width="100px">
                    </div>
                    <div class="lower-box">
                      <div class="delete-box">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`;
      return html;
    }

    $(document).on('change', '.image_upload', function() {
      //選択したfileのオブジェクトを取得
      var file = this.files[0];
      //FileReaderオブジェクトの生成
      var reader = new FileReader(); 
      //readAsDataURLで指定したFileオブジェクトを読み込む
      reader.readAsDataURL(file); 
      //読み込み時に発火するイベント onloadメソッドは読み込みが完了したら実行する
      reader.onload = function() {
        //直前に実行したイベントが返した値を取得する
        var image = this.result;

        // プレビュー画像がまだ場合
        if($('.preview-box').length == 0){
          // プレビュー用のhtmlを追加
          var html = buildHTML();      
          $('.icon').before(html);
  
          //画像を追加
          $(`.upper-box img`).attr('src', `${image}`);

        // すでにプレビュー画像が存在する場合
        }else{
          // プレビュー画像を削除
        $('.preview-box').remove();

        // プレビュー用のhtmlを追加
        var html = buildHTML();      
        $('.icon').before(html);

        //画像を追加
        $(`.upper-box img`).attr('src', `${image}`);
        }

      }
    })

    // 「削除」を押すと削除イベントが発火する
    $(document).on("click", '.delete-box', function(){
      // プレビュー画像を削除
      $('.preview-box').remove();
      // inputタグに入ってる画像ファイルも削除
      $('.image_upload').val("");
    })

  });
});