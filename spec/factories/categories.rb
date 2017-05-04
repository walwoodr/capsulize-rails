FactoryGirl.define do
  factory :pants, class: Category do
    name "Pants"
    part_of_body "legs"
  end
  factory :shirts, class: Category do
    name "Shirts"
    part_of_body "torso"
  end
  factory :layers, class: Category do
    name "Layers"
    part_of_body "torso"
  end
  factory :shoes, class: Category do
    name "Shoes"
    part_of_body "feet"
  end
  factory :jewelry, class: Category do
    name "Jewelry"
    part_of_body "torso"
  end
end
