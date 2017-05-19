function addOutfitNavListeners(){
  $(document).on("click", ".outfit-nav", function(e){
    event.preventDefault();
    var outfit = new Outfit(this);
    outfit.query().done(function(response){
      outfit.buildFromJson(response);
      outfit.buildAndAddHTML();
    });
  });
}

function addAddItemListener(){
  $(document).on("click", ".add-item", function(){
    var form = new ClothingItemForm(this);
    form.getForm().done(function(data) {
      form.setHtml(data);
  		form.addToDom();
  	});;
  })
}

$(function(){
  addOutfitNavListeners();
  addAddItemListener();
});
