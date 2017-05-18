function Category(){
  this.clothes = [];
}

Category.prototype.buildFromDomLink = function(DOMlink) {
  this.id = DOMlink.data("id");
}

Category.prototype.query = function() {
  var category = this;
  $.get('/categories/' + this.id, function(response){
    category.buildFromJson(response);
  });
}

Category.prototype.buildFromJson = function(json) {
  var category = this;
  category.name = json["name"];
  json["clothing_items"].forEach(function(itemJson){
    category.createClothing(itemJson);
  });
}

Category.prototype.createClothing = function(json) {
  var clothing = new ClothingItem(json);
  this.clothes.push(clothing);
}

function addListeners(){
  $(document).on("click", "a.category-link", function(){
    var cat = new Category();
    cat.buildFromDomLink($(this));
    cat.query();
  });
}

$(function(){
  addListeners();
});
