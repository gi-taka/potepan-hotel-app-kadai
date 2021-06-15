window.onload = function(){ 
  $(function(){
    $(".nav-trigger").on("click", function(){
      if($(".header-nav-menu").is(":visible")){
        $(".header-nav-menu").hide();
      } else {
        $(".header-nav-menu").show();
      }
    })
  })
};