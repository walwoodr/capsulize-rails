require 'rails_helper'

RSpec.describe ClothingItem, type: :model do
  let(:valid_item) do
    ClothingItem.new(name: "Jeans", color: "blue", fanciness: 2)
  end

  describe 'validations' do
    it 'is valid with a name, color and fanciness' do
      expect(valid_item).to be_valid
    end

    it 'is not valid without a name' do
      no_name = Clothing_Item.new(color: "blue", fanciness: 2)

      expect(no_name).not_to be_valid
    end

    it 'is not valid without a color' do
      no_color = Clothing_Item.new(name: "Jeans", fanciness: 2)

      expect(no_color).not_to be_valid
    end

    it 'defaults to fanciness of 3' do
      unset_fanciness = Clothing_Item.new(name: "Jeans", color: "blue")

      expect(unset_fanciness).to be_valid
      expect(unset_fanciness.fanciness).to eq(3)
    end
  end


end
