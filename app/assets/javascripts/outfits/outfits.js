function Outfit(domLink) {
  this.clothingItems = [];
  this.id = $(domLink).data("id");
  this.userId = $(domLink).data("userid");
}

Outfit.prototype.buildFromJson = function(json){
  this.id = json.id;
  this.userId = json.user.id;
  this.name = json.name;
  this.addClothingItems(json);
  this.outfitIds = json.user.outfit_ids;
  this.priorId();
  this.nextId();
}

Outfit.prototype.query = function(domLink){
  var outfit = this;
  $.get(`/users/${outfit.userId}/outfits/${outfit.id}.json`, function(response){
    outfit.buildFromJson(response);
    outfit.buildAndAddHTML();
  })
}

Outfit.prototype.addClothingItems = function(json){
  var outfit = this;
  json["clothing_items"].forEach(function(itemJson){
    var clothingItem = new ClothingItem(itemJson);
    outfit.clothingItems.push(clothingItem)
  })
}

Outfit.prototype.priorId = function(){
  var outfit = this;
  outfit.outfitIds.forEach(function(id, index){
    if(id === outfit.id) {
    	var previousIndex = index-1;
    	outfit.previousId = outfit.outfitIds[previousIndex]
    }
  });
}

Outfit.prototype.nextId = function(){
  var outfit = this;
  outfit.outfitIds.forEach(function(id, index){
    if(id === outfit.id) {
    	var nextIndex = index+1;
    	outfit.nextId = outfit.outfitIds[nextIndex]
    }
  });
}

Outfit.prototype.buildAndAddHTML = function(){
    var result = Outfit.showTemplate(this);
    this.html = result;
    $(".section").html(this.html);
}

$(function(){
  Outfit.showTemplateSource = $("#outfit-template").html();
  Outfit.showTemplate = Handlebars.compile(Outfit.showTemplateSource);
  // Outfit.maxID = //Something about the user's # of outfits...
})
