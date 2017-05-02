class ClothingItem < ApplicationRecord
  validates :name, presence: true
  validates :color, presence: true
  
end
