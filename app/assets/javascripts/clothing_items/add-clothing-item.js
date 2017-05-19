function ClothingItemForm(domLink){
  this.outfitId = $(domLink).data("id");
  this.userId = $(domLink).data("userid");
}

ClothingItemForm.prototype.getForm = function(){
  var clothingItem = this;
  return $.get(`/outfits/${clothingItem.outfitId}/clothing_items/new`);
}

ClothingItemForm.prototype.setHtml = function(data){
  this.html = data;
}

ClothingItemForm.prototype.addToDom = function(data){
  $(".outfit-options").html(this.html);
  $(".outfit-options").addClass("new-item-outfit");
}

ClothingItemForm.prototype.display = function(){
  $(".outfit-options").html("hi there")
}
