require 'rails_helper'

RSpec.feature "Layout", type: :feature do
  let (:user) { FactoryGirl.create(:user) }

  describe 'user logged in' do
    before do
      login_as(user)
      visit root_path
    end

    it 'displays authentication navigation' do
      expect(page).to have_text("Sign Out")
      expect(page).to have_text("Settings")
    end

    it 'displays app navigation' do
      expect(page).to have_text("Home")
      expect(page).to have_text("Outfits")
      expect(page).to have_text("Categories")
      expect(page).to have_text("Clothes")
      # EVENTUALLY - what to buy link
      # EVENTUALLY - friends link
      # EVENTUALLY - explore other's outfits link
    end
  end

  describe 'user not logged in' do

    it 'displays logged out navigation' do
      visit root_path
      
      expect(page).to have_text("Log In")
      expect(page).to have_text("Sign Up")
      # home
      # sign up link
      # sign in link
    end
  end

end
