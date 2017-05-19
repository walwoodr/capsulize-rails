function Outfit(domLink) {
  this.clothingItems = [];
  this.domLink = domLink;
}

Outfit.prototype.buildFromJson = function(json){
  this.id = json.id;
  this.userId = json.user.id;
  this.name = json.name;
  this.addClothingItems(json);
  this.priorId(json.user.outfit_ids);
  this.nextId(json.user.outfit_ids);
}

Outfit.prototype.query = function(domLink){
  var outfit = this;
  $.get(`${$(outfit.domLink).attr('href')}.json`, function(response){
    outfit.buildFromJson(response);
  })
}

Outfit.prototype.addClothingItems = function(json){
  var outfit = this;
  json["clothing_items"].forEach(function(itemJson){
    var clothingItem = new ClothingItem(itemJson);
    outfit.clothingItems.push(clothingItem)
  })
}

Outfit.prototype.priorId = function(outfitIds){
  var outfit = this;
  outfitIds.forEach(function(id, index){
    if(id === outfit.id) {
    	var priorIndex = index-1;
    	outfit.previousId = outfitIds[priorIndex]
    }
  });
}

Outfit.prototype.nextId = function(outfitIds){
  var outfit = this;
  outfitIds.forEach(function(id, index){
    if(id === outfit.id) {
    	var nextIndex = index+1;
    	outfit.nextId = outfitIds[nextIndex]
    }
  });
}

$(function(){
  Outfit.showTemplateSource = $("#outfit-template").html();
  Outfit.showTemplate = Handlebars.compile(Outfit.showTemplateSource);
  // Outfit.maxID = //Something about the user's # of outfits...
})
