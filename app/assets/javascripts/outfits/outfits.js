function Outfit(attrs) {
  this.id = attrs.id;
  this.userId = attrs.user_id;
  this.name = attrs.name;
  this.clothingItems = [];
  this.priorId();
  this.nextId();
  this.clothingItems(json);
}

Outfit.prototype.clothingItems = function(json){
  // ???
}

Outfit.prototype.priorId = function(){
  // do I need to create a user object in memory?
  // perhaps I can make a db call that only grabs this id and the one before and after it? I bet I can do that...

  // this.previousId -- this is going to be tricky b/c the prior outfit is not necessarily the prior id -- it's the prior by user. :-\
}

Outfit.prototype.nextId = function(){
  // do I need to create a user object in memory?
  // perhaps I can make a db call that only grabs this id and the one before and after it? I bet I can do that...

  // this.nextId -- this is going to be tricky b/c the next outfit is not necessarily the next id -- it's the next by user. :-\
}

$(function(){
  Outfit.showTemplateSource = $("#outfit-template").html();
  Outfit.showTemplate = Handlebars.compile(Outfit.showTemplateSource);
  // Outfit.maxID = //Something about the user's # of outfits... 
})
