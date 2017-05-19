function Outfit(json) {
  this.id = json.id;
  this.userId = attrs.user.id;
  this.name = json.name;
  this.clothingItems = [];
  this.addClothingItems(json);
  this.priorId(json.user.outfit_ids);
  this.nextId(json.user.outfit_ids);
}

Outfit.prototype.addClothingItems = function(json){
  var outfit = this;
  json["clothing_items"].forEach(function(itemJson){
    var clothingItem = new ClothingItem(itemJson);
    outfit.clothingItems.push(clothingItem)
  })
}

Outfit.prototype.priorId = function(outfitIds){
  this.previousId = outfitIds.forEach(function(id, index){
                      if(id === 23) {
                      	var priorIndex = index-1;
                      	return outfitIds[priorIndex]
                      }
                    });
}

Outfit.prototype.nextId = function(outfitIds){
  this.nextId = outfitIds.forEach(function(id, index){
                  if(id === 23) {
                  	var nextIndex = index-1;
                  	return outfitIds[nextIndex]
                  }
                });
}

$(function(){
  Outfit.showTemplateSource = $("#outfit-template").html();
  Outfit.showTemplate = Handlebars.compile(Outfit.showTemplateSource);
  // Outfit.maxID = //Something about the user's # of outfits...
})
