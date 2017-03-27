$(function(){
  // 「id="jQueryBox"」を非表示
  $(".comment_box").css("display", "none");
  // 「id="jQueryPush"」がクリックされた場合
  $(".comment_open").on('click', function(){
    // 「id="jQueryBox"」の表示、非表示を切り替える
    $(".comment_box", this).toggle();
  });
});