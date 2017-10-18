
function changeSelect(){

  var categoryName = $('#category').find(":selected").val();
  if(categoryName=="NY"){
    $("iframe").remove();
    $("#product").append('<iframe src="917.html" frameborder="0" scrolling="no" height="900px" width="100%" </iframe>')
    .append('<iframe src="Supreme.html" frameborder="0" scrolling="no" height="700px" width="100%" </iframe>');
  }
  else if(categoryName=="activist"){
    $("iframe").remove();
    $("#product").append('<iframe src="hm.html" frameborder="0" scrolling="no" height="700px" width="100%" </iframe>')
    .append('<iframe src="ports.html" frameborder="0" scrolling="no" height="700px" width="100%" </iframe>');
  }
}
