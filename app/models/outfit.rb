class Outfit < ApplicationRecord
  has_many :outfit_clothing_items
  has_many :clothing_items, through: :outfit_clothing_items
  belongs_to :user

  validates :user, presence: true
  validates :clothing_items, :length => { :minimum => 2 }

  def clothing_item=(attributes_hash)
    self.save
    item = self.clothing_items.build(attributes_hash)
    item.users << self.user
    item.save
  end
end
