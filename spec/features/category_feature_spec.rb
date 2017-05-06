require 'rails_helper'

RSpec.feature "Category", type: :feature do
  let (:user) { FactoryGirl.create(:user) }

  describe 'user logged in' do
    before do
      login_as(user)
    end

    describe 'index page' do
      before do
        visit categories_path
      end
      let(:f_cat) { Category.first }
      let(:l_cat) { Category.last }

      it 'displays a list of clothing category links' do
        expect(page).to have_link("View #{f_cat.name}")
        expect(page).to have_link("View #{l_cat.name}")
        expect(page).to have_css('div.category', count: Category.all.size)
      end
    end

    describe 'show page' do
      let(:f_cat) { Category.find(5) }
      before do
        visit category_path(f_cat)
      end

      it 'displays a list of clothing items in the category' do
        expect(page).to have_text(f_cat.clothing_items.first.name)
        expect(page).to have_text(f_cat.clothing_items.first.color)
        expect(page).to have_text(f_cat.clothing_items.last.name)
        expect(page).to have_text(f_cat.clothing_items.last.color)
        expect(page).to have_css('li.clothing-item', count: f_cat.clothing_items.size)
      end

      it 'allows users to add a clothing item to their closet' do
        expect(page).to have_link("Add to my closet")
        #expect(page).to have_link("Bulk add")
      end
    end
  end

  describe 'admin' do
    xit 'allows editing categories' do
      # eventually
    end

    xit 'allows creating new categories' do
      # eventually
    end
  end

  describe 'user not logged in' do

    let(:f_cat) { Category.first }

    it 'index redirects to login screen' do
      visit categories_path

      expect(page).to have_text("Log in")
      expect(page).not_to have_link("View #{f_cat.name}")
    end

    it 'show redirects to login screen' do
      f_cat = Category.find(5)
      visit category_path(f_cat)

      expect(page).to have_text("Log in")
      expect(page).not_to have_text(f_cat.clothing_items.first.name)
    end
  end

end
