$(function(){
  var showImage = function(input){
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.preview_target').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $(".picture_to_render").change(function(){
    showImage(this);
  });
});
