function addDetailsListeners(){
  $(document).on("click", "a.details-outfit", function(event){
    event.preventDefault();
    var outfit = new Outfit(this);
    outfit.query();
  })
}

$(function(){
  addDetailsListeners();
})
