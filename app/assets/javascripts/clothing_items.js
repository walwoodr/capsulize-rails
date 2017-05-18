function ClothingItem(json) {
  this.name = json["name"];
  this.color = json["color"];
  this.fanciness = json["fanciness"];
}

// Note: this function replicates the word_fanciness helper in clothing_item_helper
ClothingItem.prototype.wordFanciness = function(){
  switch(this.fanciness) {
    case 1:
      return "scruffy";
      break;
    case 2:
      return "comfy";
      break;
    case 3:
      return "nice";
      break;
    case 4:
      return "spiffy";
      break;
    case 5:
      return "fancy";
      break;
  };
}

// Note: this function replicates the attributes_display helper in clothing_item_helper
ClothingItem.prototype.attributesDisplay = function(){
  return `${this.name} | ${this.color} | ${this.wordFanciness()}`
}
