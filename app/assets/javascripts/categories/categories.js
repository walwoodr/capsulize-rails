function Category(){
  this.clothingItems = [];
}

Category.prototype.buildFromDomLink = function(domLink) {
  this.id = domLink.data("id");
  if (this.id > 1) {
    this.previousId = parseInt(this.id)-1;
  }
  if (this.id < Category.maxID) {
    this.nextId = parseInt(this.id)+1;
  }
  this.domLink = domLink;
}

Category.prototype.buildFromJson = function(json) {
  var category = this;
  category.name = json["name"];
  json["clothing_items"].forEach(function(itemJson){
    category.createClothingItem(itemJson);
  });
}

Category.prototype.query = function() {
  var category = this;
  return $.get(`/categories/${category.id}`)
}

Category.prototype.queryAndAdd = function(){
  var category = this;
  category.query().done(function(result){
    category.buildFromJson(result);
    category.buildAndAddHTML();
  });
}

Category.prototype.createClothingItem = function(json) {
  var clothingItem = new ClothingItem(json);
  this.clothingItems.push(clothingItem);
}

Category.prototype.buildAndAddHTML = function() {
  var items = this.clothingItems;
  var result = Category.showTemplate(this);
  this.html = result;
  $(".section").html(this.html);
}

$(function(){
  Category.showTemplateSource = $("#category-template").html();
  Category.showTemplate = Handlebars.compile(Category.showTemplateSource);
  Category.maxID = $(".category").length;
})
