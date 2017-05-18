require 'rails_helper'

RSpec.describe "Categories", type: :feature do
  let (:user) { FactoryGirl.create(:user) }
  let(:f_cat) { Category.first }
  let(:first_item) { f_cat.clothing_items.first }

  before do
    login_as(user)
    visit categories_path
  end

  describe "categories index - show" do
    it 'requires javascript to view clothing items' do

      expect(page).to have_content f_cat.name
      click_link "View #{f_cat.name}"
      expect(page).not_to have_content first_item.name
    end

    it 'loads clothing items in category without page refresh', js: true do

      expect(page).to have_content f_cat.name
      click_link "View #{f_cat.name}"
      expect(page).to have_content first_item.name
      expect(page).to have_content first_item.color
    end
  end
end
