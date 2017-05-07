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
      let(:jackets) { Category.find_by(name: "jackets") }
      let(:first_item) { jackets.clothing_items.first }
      before do
        visit category_path(jackets)
      end

      it 'displays a list of clothing items in the category' do
        expect(page).to have_text(first_item.name)
        expect(page).to have_text(first_item.color)
        expect(page).to have_css('li.clothing-item', count: jackets.clothing_items.size)
      end

      it 'shows link to add a clothing item to their closet' do
        expect(page).to have_link("Add to my closet")
      end

      xit 'only shows link to add a clothing item to their closet if the user doesn\'t already have the itme in their closet' do
        expect(page).to have_link("Add to my closet")
      end

      it 'adds clothing item to their closet on link click' do
        click_link("Add to my closet")

        expect(page).to have_text("#{first_item.name} have been added to your closet")
        expect(page).to have_text(first_item.name)
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
