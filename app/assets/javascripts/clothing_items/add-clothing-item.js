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
  $(".outfit-buttons").addClass("hidden");
  $(".outfit-options").html(this.html);
  $(".outfit-options").addClass("new-item-outfit");
}

ClothingItemForm.prototype.addCreateItemListener = function(){
  var form = this;
  $("div.outfit-options form").on("submit", function(e){
    e.preventDefault();
    form.values = $(this).serialize();
    form.postForm().success(function(data){
      var clothingItem = new ClothingItem(data);
      if (data.id !== null) {
        $("ul").append(clothingItem.attributesLi());
        $(".outfit-options").html("");
        $(".outfit-options").removeClass("new-item-outfit");
        $(".outfit-buttons").removeClass("hidden");
      } else {
        $(".outfit-options").html(`<div class="alert-flash">Sorry, that clothing item is invalid.</div>`);
        $(".outfit-options").removeClass("new-item-outfit");
        $(".outfit-buttons").removeClass("hidden");
      }
    });
  })
}

ClothingItemForm.prototype.postForm = function() {
  var form = this;
  return $.post(`/outfits/${form.outfitId}/clothing_items`, form.values)
}
