class ClothingItem < ApplicationRecord
  validates :name, presence: true
  validates :color, presence: true
  validates :fanciness, presence: true,
                        inclusion: { in: 1..5 }
  validates :category, presence: true

  belongs_to :category

  has_many :outfit_clothing_items
  has_many :outfits, through: :outfit_clothing_items

  has_many :user_clothing_items
  has_many :users, through: :user_clothing_items

  # scope called as ClothingItem.users(user_object)
  scope :users, lambda { |user|
    joins(:user_clothing_items).where(user_clothing_items: {user_id: user.id})
  }

end
