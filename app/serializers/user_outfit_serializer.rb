class UserOutfitSerializer < ActiveModel::Serializer
  attributes :id
  # has_many :outfits, serializer: OutfitUserSerializer, include_nested_associations: true
end
