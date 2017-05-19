function addListeners(){
  $(document).on("click", "button.category-button", function(e){
    e.preventDefault();
    var categoryLink = this;
    var category = new Category();
    category.buildFromDomLink($(categoryLink));
    category.query();
  });
}

$(function(){
  addListeners();
});
