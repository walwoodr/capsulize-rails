require 'rails_helper'

RSpec.describe 'user logged in', type: :feature do
  let(:category) {Category.first}
  let(:user) {User.first}
  let(:outfit) { user.outfits.first }
  let(:clothing_item) { outfit.clothing_items.first }

  before do
    login_as(user)
  end

  describe 'outfits index page' do
    before do
      visit user_outfits_path(user)
    end

    it 'has a number of outfit divs matching number of outfits' do
      expect(page).to have_css('div.outfit', count: user.outfits.size)
    end

    it 'displays information about the outfit' do
      expect(page).to have_text(user.outfits.first.name)
      expect(page).to have_text(user.outfits.second.clothing_items.first.name)
      expect(page).to have_text(user.outfits.last.clothing_items.first.color)
    end

    it 'displays a link to create a new outfit' do
      expect(page).to have_link("New Outfit")
      expect(page).to have_css('a#new-outfit')
      expect(page).to have_xpath(:href => user_new_outfit_path)
    end
  end

  describe 'outfit show' do
    before do
      visit user_outfit_path(user, outfit)
    end

    it 'displays the outfit\'s name' do
      expect(page).to have_text(outfit.name)
    end

    it 'displays a link to edit the outfit' do
      expect(page).to have_text(outfit.name)

    end

    xit 'displays a link to riff on the outfit (duplicate & modify)' do

    end
  end

  describe 'new outfit page' do
    it 'displays a form to create a new outfit' do

    end

    it 'displays clothes options by category' do

    end

    it 'allows you to create a new item of clothing on the outfit' do

    end
  end

  describe 'new outfit creation' do
    it 'creates a new outfit belonging to the user' do

    end

    it 'redirects to view the new outfit' do

    end
  end

  describe 'outfit modification page' do
    it 'displays a form to change the existing outfit' do

    end

    it 'displays a button to delete the outfit' do

    end

    it 'displays clothes options by category' do

    end

    it 'allows you to create a new item of clothing on the outfit' do

    end
  end

  describe 'modify outfit' do
    it 'changes the outfit belonging to the user' do
      # does not create a new outfit
    end

    it 'redirects to view the show outfit page' do

    end
  end

  describe 'outfit deletion' do
    it 'deletes the outfit' do

    end

    it 'redirects to the outfit index page' do

    end
  end

end

describe 'user not logged in' do

  it 'renders an error message' do

  end
end
