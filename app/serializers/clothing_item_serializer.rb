class ClothingItemSerializer < ActiveModel::Serializer
  type :clothing_item
  attributes :name, :color, :fanciness, :id
  belongs_to :category
end
