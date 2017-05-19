function ClothingItemForm(domLink){
  this.outfitId = $(domLink).data("id");
  this.userId = $(domLink).data("userid");
}

ClothingItemForm.prototype.getForm = function(){
  var clothingItem = this;
  $.get(`/outfits/${clothingItem.outfitId}/clothing_items/new`, function(response){
    clothingItem.html = response;
    clothingItem.addToDom();
  })
}

ClothingItemForm.prototype.addToDom = function(){
  $(".outfit-buttons").html(this.html);
  $(".outfit-buttons").addClass("new-item-outfit");
}

ClothingItemForm.prototype.display = function(){
  $(".outfit-buttons").html("hi there")
}
