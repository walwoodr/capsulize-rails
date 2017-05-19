function addOutfitNavListeners(){
  $(document).on("click", ".outfit-nav", function(e){
    event.preventDefault();
    var outfit = new Outfit(this);
    outfit.query();
  });
}

function addAddItemListener(){
  $(document).on("click", ".add-item", function(){
    debugger;
    var form = new ClothingItemForm(this);
    form.getForm();
  })
}

$(function(){
  addOutfitNavListeners();
  addAddItemListener();
});
