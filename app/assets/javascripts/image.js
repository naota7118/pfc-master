$(function(){
  //画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="post[images_attributes][${index}][image]"
                    id="post_images_attributes_${index}_image"><br>
                    <div class="js-zoom">拡大</div>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5];

  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $(document).on('change', function() { 
    console.log('hello');
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));
    // 配列の最初の要素を取り除く
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1) 
  });

  $('#image-box').on('click', 'js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]);)
  })



});