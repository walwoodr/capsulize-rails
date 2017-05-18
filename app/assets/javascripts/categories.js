function Category(){
  this.clothingItems = [];
}

Category.prototype.buildFromDomLink = function(domLink) {
  this.id = domLink.data("id");
  if (this.id > 1) {
    this.previousId = parseInt(this.id)-1;
  }
  this.nextId = parseInt(this.id)+1;
  this.domLink = domLink;
}

Category.prototype.query = function() {
  var category = this;
  $.get(`/categories/${category.id}`, function(result){
      category.buildFromJson(result);
      category.buildAndAddHTML();
    })
}

Category.prototype.buildFromJson = function(json) {
  var category = this;
  category.name = json["name"];
  json["clothing_items"].forEach(function(itemJson){
    category.createClothingItem(itemJson);
  });
}

Category.prototype.createClothingItem = function(json) {
  var clothingItem = new ClothingItem(json);
  this.clothingItems.push(clothingItem);
}

Category.prototype.buildAndAddHTML = function() {
  var items = this.clothingItems;
  console.log(this.id);
  var template = Handlebars.compile($("#category-template").html());
  var result = template(this);
  this.html = result;
  $(".section").html(this.html);
}


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
