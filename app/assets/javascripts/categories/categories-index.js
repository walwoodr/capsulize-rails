function addListeners(){
  $(document).on("click", "a.category-link", function(e){
    e.preventDefault;
    var categoryLink = this;
    var category = new Category();
    category.buildFromDomLink($(categoryLink));
    category.query();
  });
}

$(function(){
  addListeners();
});
