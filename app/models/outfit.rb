class Outfit < ApplicationRecord
  has_many :outfit_clothing_items
  has_many :clothing_items, through: :outfit_clothing_items
  belongs_to :user

  validates :user, presence: true
  validates :clothing_items, :length => { :minimum => 2 }

  def clothing_item=(attributes_hash)
    if attributes_hash[:name] != ""
      item = self.clothing_items.build(attributes_hash)
      item.users << self.user
      self.save
      # raise self.inspect
    end
  end
end
