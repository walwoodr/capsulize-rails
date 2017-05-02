require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.find_or_create_by(email: "r@r.r") }
  let(:pants) { Category.new(name: "pants", part_of_body: "legs") }
  let(:clothing_attributes) { {name: "Jeans", color: "blue", fanciness: 2, category: pants} }
  let(:clothing_attributes_2) { {name: "Khakis", color: "brown", fanciness: 1, category: pants} }
  let(:outfit_attributes) { {name: "Night on the town"} }
  let(:outfit_attributes_2) { {name: ""} }

  # authentication and validation through Devise.
  # TODO Devise features should ideally have specs

  describe 'associations' do

    it 'has many clothing items' do
      user.clothing_items.create(clothing_attributes)
      user.clothing_items.create(clothing_attributes_2)

      expect(user.clothing_items.size).to eq(2)
    end

    it 'has many outfits' do
      user.outfits.create(outfit_attributes)
      user.outfits.create(outfit_attributes_2)

      expect(user.outfits.size).to eq(2)
    end

  end

end
