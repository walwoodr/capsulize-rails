# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
    - Outfit show page rendered from outfit index (/users/2/outfits)
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
    - Category items index rendered from category index
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
    - category has many clothing items
    - outfit has many clothing items
    - user has many outfits (information rendered via next/previous nav in outfits)
- [x] Include at least one link that loads or updates a resource without reloading the page.
    - all of my jquery features fulfill this requirement
- [x] Translate JSON responses into js model objects.
    - I used js model objects of outfits, categories and clothing items
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
    - there are many of these

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
