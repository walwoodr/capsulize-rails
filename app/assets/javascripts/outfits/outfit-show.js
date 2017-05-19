function addOutfitNavListeners(){
  $(document).on("click", ".outfit-nav", function(e){
    event.preventDefault();
    var outfit = new Outfit(this);
    outfit.query();
  });
}

$(function(){
  addOutfitNavListeners();
});
