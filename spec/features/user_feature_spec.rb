require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let (:user) { FactoryGirl.create(:user) }

  describe 'user logged in' do
    before do
      login_as(user)
    end

    it 'displays biggest closet' do
      visit user_biggest_closet_path
      bc_user = User.biggest_closet

      expect(page).to have_text(bc_user.first_name)
      expect(page).to have_text("Who has an astonishing #{bc_user.clothing_items.size} items in their closet.")
    end
  end
end
