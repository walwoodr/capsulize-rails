class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, :omniauth_providers => [:facebook]

  # validates :first_name, presence: true

  has_many :user_clothing_items
  has_many :clothing_items, through: :user_clothing_items

  has_many :outfits

  def self.biggest_closet
    all.joins(:user_clothing_items).select("users.*, count(user_clothing_items.clothing_item_id) AS item_count").group("users.id").order("item_count DESC").limit(1).first
  end

  def add_to_closet(clothing_item)
    self.user_clothing_items.find_or_create_by(clothing_item_id: clothing_item.id)
  end

  def remove_from_closet(clothing_item)
    uci = self.user_clothing_items.find_by(clothing_item_id: clothing_item.id)
    uci.delete
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
