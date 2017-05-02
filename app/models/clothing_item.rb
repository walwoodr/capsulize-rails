class ClothingItem < ApplicationRecord
  validates :name, presence: true
  validates :color, presence: true
  validates :fanciness, presence: true,
                        inclusion: { in: 1..5 }
  validates :category, presence: true

  belongs_to :category

end
