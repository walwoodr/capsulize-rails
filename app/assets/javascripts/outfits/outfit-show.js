function addOutfitNavListeners(){
  $(document).on("click", ".outfit-nav", function(e){
    event.preventDefault();
    var outfit = new Outfit(this);
    outfit.query();
  });
}

function addAddItemListener(){
  $(document).on("click", ".add-item", function(){
    console.log("you clicked add clothing item")
  })
}

$(function(){
  addOutfitNavListeners();
  addAddItemListener();
});
