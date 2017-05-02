class Outfit < ApplicationRecord
  has_many :outfit_clothing_items
  has_many :clothing_items, through: :outfit_clothing_items
  belongs_to :user

  validates :user, presence: true
end
