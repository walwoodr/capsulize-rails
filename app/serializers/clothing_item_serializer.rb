class ClothingItemSerializer < ActiveModel::Serializer
  type :clothing_item
  attributes :name, :color, :fanciness
  belongs_to :category
end
