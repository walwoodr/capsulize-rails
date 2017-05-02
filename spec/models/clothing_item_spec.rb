require 'rails_helper'

RSpec.describe ClothingItem, type: :model do
  let(:pants) { Category.new(name: "pants", part_of_body: "legs") }
  let(:valid_item) { ClothingItem.new(name: "Jeans", color: "blue", fanciness: 2, category: pants) }

  describe 'validates' do
    it 'is valid with a name, color, category and fanciness' do
      expect(valid_item).to be_valid
    end

    it 'is not valid without a name' do
      no_name = ClothingItem.new(color: "blue", fanciness: 2, category: pants)

      expect(no_name).not_to be_valid
    end

    it 'is not valid without a color' do
      no_color = ClothingItem.new(name: "Jeans", fanciness: 2, category: pants)

      expect(no_color).not_to be_valid
    end

    it 'is not valid without a category' do
      no_category = ClothingItem.new(name: "Jeans", fanciness: 2, color: "blue")

      expect(no_category).not_to be_valid
    end

    describe 'fanciness' do
      it 'defaults to 3' do
        unset_fanciness = ClothingItem.new(name: "Jeans", color: "blue", category: pants)

        expect(unset_fanciness).to be_valid
        expect(unset_fanciness.fanciness).to eq(3)
      end

      it 'is valid between 1 and 5' do
        fanciness_one = ClothingItem.new(name: "Jeans", color: "blue", fanciness: 1, category: pants)
        fanciness_three = ClothingItem.new(name: "Jeans", color: "blue", fanciness: 3, category: pants)
        fanciness_five = ClothingItem.new(name: "Jeans", color: "blue", fanciness: 5, category: pants)

        expect(fanciness_one).to be_valid
        expect(fanciness_three).to be_valid
        expect(fanciness_five).to be_valid
      end

      it 'is invalid between 1 and 5' do
        fanciness_zero = ClothingItem.new(name: "Jeans", color: "blue", fanciness: 0, category: pants)
        fanciness_twelve = ClothingItem.new(name: "Jeans", color: "blue", fanciness: 12, category: pants)

        expect(fanciness_zero).not_to be_valid
        expect(fanciness_twelve).not_to be_valid
      end
    end
  end

  describe 'associations' do

    it 'belongs to a category' do
      expect(valid_item.category).to eq(pants)
    end

    it 'has many outfits' do
      first_outfit = Outfit.create
      first_outfit.clothing_items << valid_item
      second_outfit = Outfit.create
      second_outfit.clothing_items << valid_item

      expect(valid_item.outfits.size).to eq(2)
    end

    it 'has many users' do
      first_user = User.find_or_create_by(email: "r@r.r")
      first_user.clothing_items << valid_item
      second_user = User.find_or_create_by(email: "a@a.a")
      second_user.clothing_items << valid_item

      expect(valid_item.users.size).to eq(2)
    end

  end

  # TODO - add spec for enum for fanciness

end
