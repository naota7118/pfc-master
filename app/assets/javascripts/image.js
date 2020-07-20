$(function(){

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10,11,12];

  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $(document).on('change', '#post_image', function() { 

    $('.hidden-destroy').hide();
    // fileIndexの先頭の数字を使ってinputを作る  
    $('.hidden-content').append(buildFileField(fileIndex[0]));
    
  })

});