class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :clothing_items, serializer: ClothingItemSerializer
end
