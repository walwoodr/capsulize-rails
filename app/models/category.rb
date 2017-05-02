class Category < ApplicationRecord
  validates :part_of_body, presence: true,
                           inclusion: { in: %w(legs arms torso wrist finger hand(s) body head neck waist feet ankles ears shoulders), message: "%{value} is not a valid body part." }
  validates :name, presence: true

  has_many :clothing_items

end
