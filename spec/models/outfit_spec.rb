require 'rails_helper'

RSpec.describe Outfit, type: :model do

  describe 'validations' do
    it 'is valid with a name and two or more clothing items' do
      outfit = Outfit.new(name: "Fave outfit", clothing_item_ids: [3, 4])

      expect(outfit).to be_valid
    end

    it 'is valid with items that belong to the user' do
      user = User.first
      outfit = user.outfits.build(clothing_items: [user.clothing_items.first, user.clothing_items.last])

      expect(outfit).to be_valid
    end
  end

  describe 'associations' do
    # TODO add specs
  end

  describe 'class methods' do
    # TODO add specs
    xit 'adds clothing items to the user if the user doesn\'t already own the item' do
      #write a spec for this
    end
  end

end
