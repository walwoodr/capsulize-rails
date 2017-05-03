require 'rails_helper'

RSpec.describe User, type: :model do
  let(:test_user) { create(:user) }
  let(:pants) { Category.new(name: "pants", part_of_body: "legs") }
  let(:clothing_attributes) { {name: "Jeans", color: "blue", fanciness: 2, category: pants} }
  let(:clothing_attributes_2) { {name: "Khakis", color: "brown", fanciness: 1, category: pants} }
  let(:outfit_attributes) { {name: "Night on the town"} }
  let(:outfit_attributes_2) { {name: ""} }


  describe 'validations' do
  # authentication and validation through Devise.
  # TODO Devise features should ideally have specs
    it 'is valid with a first and last name' do
      expect(test_user).to be_valid
    end

    it 'is invalid without a first name' do
      user = User.new(email: "test@test.com", last_name: "Moony")

      expect(user).not_to be_valid
    end

    it 'is invalid without a last name' do
      user = User.new(email: "test@test.com", first_name: "Moony")

      expect(user).not_to be_valid
    end
  end


  describe 'associations' do

    it 'has many clothing items' do
      test_user.clothing_items.create(clothing_attributes)
      test_user.clothing_items.create(clothing_attributes_2)

      expect(test_user.clothing_items.size).to eq(2)
    end

    it 'has many outfits' do
      test_user.outfits.create(outfit_attributes)
      test_user.outfits.create(outfit_attributes_2)

      expect(test_user.outfits.size).to eq(2)
    end

  end

end
