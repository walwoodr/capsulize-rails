function addListeners(){
  $(document).on("click", "a.category-link", function(){
    var categoryId = $(this).data("id");
    $.get('/categories/' + categoryId, function(response){
      console.log(response)
    });
  });
};

$(function(){
  addListeners();
});
