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
      new_item = ClothingItem.create(name: "Asymetric crop top", color: "blue", fanciness: 5, category: Category.find_by(name: 'shirt'))
      Outfit.create(clothing_items: [new_item, ClothingItem.find(3)], user_id: 1)
      Outfit.create(clothing_items: [new_item, ClothingItem.find(8)], user_id: 1)

      expect(new_item.outfits.size).to eq(2)
    end

    it 'has many users' do
      first_user = create(:user)
      first_user.clothing_items << valid_item
      second_user = create(:user_2)
      second_user.clothing_items << valid_item

      expect(valid_item.users.size).to eq(2)
    end

  end

  describe 'scope' do

    it 'has a scope for user' do
      user = create(:user)
      category = Category.first


      expect(ClothingItem.users(user).size).to eq(user.clothing_items.size)
      expect(category.clothing_items.users(user).size).to eq(user.clothing_items.where(category_id: category.id).size)
    end

  end

  # TODO - add spec for enum for fanciness

end
