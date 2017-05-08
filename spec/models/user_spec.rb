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

    xit 'is invalid without a first name' do
      user = User.new(email: "test@test.com", last_name: "Moony")

      expect(user).not_to be_valid
    end

    it 'is valid without a last name' do
      user = User.new(email: "test@test.com", first_name: "Moony")

      expect(user).to be_valid
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

  describe 'scope' do

    it 'knows which user has the biggest closet' do
      user_outfits = [0, ""]
      User.all.each do |user|
        if user.outfits.size > user_outfits[0]
          user_outfits[0] = user.outfits.size
          user_outfits[1] = user.id
        end
      end

      expect(User.biggest_closet).to eq(User.find(user_outfits[1]))
    end

  end

  describe 'methods' do

    let(:user) { FactoryGirl.create(:user) }
    let(:pants) { FactoryGirl.create(:pants) }
    let(:jeans) { FactoryGirl.create(:jeans, category: pants, color: "rainbow stripes") }

    it '.add_to_closet adds the item to the user\'s closet' do
      user.add_to_closet(jeans)

      expect(user.clothing_items.last).to eq(jeans)
      expect(user.clothing_items.find_by(name: jeans.name)).not_to be_nil
    end

    it '.remove_from_closet remvoes the item from the user\'s closet' do
      user.add_to_closet(jeans)
      user.remove_from_closet(jeans)

      expect(user.clothing_items.last).not_to eq(jeans)
      expect(user.clothing_items.find_by(name: jeans.name)).to be_nil
    end

  end

end
