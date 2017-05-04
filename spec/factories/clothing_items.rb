FactoryGirl.define do
  factory :jeans, class: ClothingItem do
    name "Jeans"
    color "blue"
  end
  factory :tshirt, class: ClothingItem do
    name "T-shirt"
    color "blue"
  end
  factory :sneakers, class: ClothingItem do
    name "Sneakers"
    color "blue"
  end
  factory :necklace, class: ClothingItem do
    name "Necklace"
    color "blue"
  end
  factory :vest, class: ClothingItem do
    name "Vest"
    color "blue"
    fanciness 4
  end
end
