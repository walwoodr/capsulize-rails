class OutfitSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :clothing_items, serializer: ClothingItemSerializer
  belongs_to :user, serializer: UserOutfitSerializer
end
