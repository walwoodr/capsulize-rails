class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :user_clothing_items
  has_many :clothing_items, through: :user_clothing_items

  has_many :outfits

end
