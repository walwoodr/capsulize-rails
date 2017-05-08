# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
    - user has many outfits
    - user has many clothing items
    - category has many clothing items
    - outfits have many clothing items

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
    - outfit belongs to user
    - clothing item belongs to category

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
    - outfit has many clothing items through join table
    - clothing item has many users through join table

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
    - clothing items can be can be created by users through outfits and independently

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - User contains validation through Devise
    - Category validates attributes
    - ClothingItem validates attributes
    - Outfit validates attributes

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - User model has a "biggest closet" method that returns the user with the biggest closet. Can be found at "/user/biggest_closet"

- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
    - Clothing Items can be created with outfits

- [x] Include signup (how e.g. Devise)
    - Used Devise

- [x] Include login (how e.g. Devise)
    - Used Devise

- [x] Include logout (how e.g. Devise)
    - Used Devise

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - Used omniauth gem for Facebook.

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    - Outfits are nested in users

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
    - Outfits are created on users

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    - When creating ("/users/1/outfits/new") or editing ("/users/1/outfits/1/edit") an outfit, the form will display an error div when there are not enough clothing items in the outfit.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
