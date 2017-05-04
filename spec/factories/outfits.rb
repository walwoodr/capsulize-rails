FactoryGirl.define do
  factory :outfit do
    user :user
    clothing_items [:jeans, :tshirt]
  end

  factory :outfit_2, class: Outfit do
    user :user_2
    clothing_items [:jeans, :necklace, :tshirt, :vest]
  end

end
