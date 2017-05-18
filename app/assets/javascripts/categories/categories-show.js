function addNavListeners(){
  $(document).on("click", ".category-nav", function(e){
    e.preventDefault;
    var categoryLink = this;
    var category = new Category();
    category.buildFromDomLink($(categoryLink));
    category.query();
  });
}

$(function(){
  addNavListeners();
});
