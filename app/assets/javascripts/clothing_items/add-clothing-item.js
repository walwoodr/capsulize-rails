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

ClothingItemForm.prototype.addCreateItemListener = function(){
  var form = this;
  $("div.outfit-options form").on("submit", function(e){
    e.preventDefault();
    form.values = $(this).serialize();
    form.postForm().done(function(data){
      var clothingItem = new ClothingItem(data);
      $("ul").append(clothingItem.attributesLi());
      $(".outfit-options").html("");
      $(".outfit-options").removeClass("new-item-outfit");
    })
  })
}

ClothingItemForm.prototype.postForm = function() {
  var form = this;
  return $.post(`/outfits/${form.outfitId}/clothing_items`, form.values)
}
