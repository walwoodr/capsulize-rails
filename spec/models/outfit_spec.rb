require 'rails_helper'

RSpec.describe Outfit, type: :model do

  describe 'validations' do
    it 'is valid with a user, name and two or more clothing items' do
      outfit = Outfit.new(name: "Fave outfit", clothing_item_ids: [3, 4], user_id: 1)

      expect(outfit).to be_valid
    end

    it 'is invalid without two or more clothing items' do
      outfit1 = Outfit.new(name: "Fave outfit", clothing_item_ids: [3], user_id: 1)
      outfit2 = Outfit.new(name: "Fave outfit", user_id: 1)

      expect(outfit1).not_to be_valid
      expect(outfit2).not_to be_valid
    end

    it 'is invalid without a user' do
      outfit = Outfit.new(name: "Fave outfit", clothing_item_ids: [3, 4])

      expect(outfit).not_to be_valid
    end

    it 'is valid with items that belong to the user' do
      user = User.first
      outfit = user.outfits.build(clothing_items: [user.clothing_items.first, user.clothing_items.last])

      expect(outfit).to be_valid
    end
  end

  describe 'associations' do

      it 'belongs to a user' do
        user = User.first
        outfit = user.outfits.build(clothing_items: [user.clothing_items.first, user.clothing_items.last])

        expect(outfit.user).to eq(user)
      end

      it 'has many clothing items' do
        outfit = Outfit.new(name: "Fave outfit", clothing_item_ids: [3, 4])
        outfit2 = Outfit.new(name: "Fave outfit", clothing_item_ids: [1, 8, 5])
        outfit3 = Outfit.new(name: "Fave outfit", clothing_item_ids: [10, 15, 1, 2])

        expect(outfit.clothing_items.size).to eq(2)
        expect(outfit2.clothing_items.size).to eq(3)
        expect(outfit3.clothing_items.size).to eq(4)
      end

      it 'knows about its clothing objects' do
        outfit = Outfit.new(name: "Fave outfit", clothing_item_ids: [3, 4])

        expect(outfit.clothing_items.first.name).to eq(ClothingItem.find(3).name)
        expect(outfit.clothing_items.last.color).to eq(ClothingItem.find(4).color)
        expect(outfit.clothing_items.size).to eq(2)
      end
  end

  describe 'class methods' do
    # TODO add specs
    xit 'adds clothing items to the user if the user doesn\'t already own the item' do
      #write a spec for this
    end
  end

end
