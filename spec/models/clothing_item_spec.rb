require 'rails_helper'

RSpec.describe ClothingItem, type: :model do
  let(:valid_item) do
    ClothingItem.new(name: "Jeans", color: "blue", fanciness: 2)
  end

  describe 'validates' do
    it 'is valid with a name, color and fanciness' do
      expect(valid_item).to be_valid
    end

    it 'is not valid without a name' do
      no_name = ClothingItem.new(color: "blue", fanciness: 2)

      expect(no_name).not_to be_valid
    end

    it 'is not valid without a color' do
      no_color = ClothingItem.new(name: "Jeans", fanciness: 2)

      expect(no_color).not_to be_valid
    end

    it 'defaults to fanciness of 3' do
      unset_fanciness = ClothingItem.new(name: "Jeans", color: "blue")

      expect(unset_fanciness).to be_valid
      expect(unset_fanciness.fanciness).to eq(3)
    end

    it 'fanciness is valid between 1 and 5' do
      fanciness_one = ClothingItem.new(name: "Jeans", color: "blue", fanciness: 1)
      fanciness_three = ClothingItem.new(name: "Jeans", color: "blue", fanciness: 3)
      fanciness_five = ClothingItem.new(name: "Jeans", color: "blue", fanciness: 5)

      expect(fanciness_one).to be_valid
      expect(fanciness_three).to be_valid
      expect(fanciness_five).to be_valid
    end

    it 'fanciness is invalid between 1 and 5' do
      fanciness_zero = ClothingItem.new(name: "Jeans", color: "blue", fanciness: 0)
      fanciness_twelve = ClothingItem.new(name: "Jeans", color: "blue", fanciness: 12)

      expect(fanciness_zero).not_to be_valid
      expect(fanciness_twelve).not_to be_valid
    end
  end


end
