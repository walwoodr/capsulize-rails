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
        expect(page).to have_link(f_cat.name)
        expect(page).to have_link(l_cat.name)
        expect(page).to have_css('div.category', count: Category.all.size)
      end
    end

    describe 'show page' do
      let(:t_cat) { Category.find(3) }
      before do
        visit category_path(t_cat)
      end

      it 'displays a list of clothing items in the category' do
        expect(page).to have_text(t_cat.clothing_items.first.name)
        expect(page).to have_text(t_cat.clothing_items.first.color)
        expect(page).to have_text(word_fanciness(t_cat.clothing_items.first))
        expect(page).to have_text(t_cat.clothing_items.last.name)
        expect(page).to have_text(t_cat.clothing_items.last.color)
        expect(page).to have_text(word_fanciness(t_cat.clothing_items.last))
        expect(page).to have_css('li.clothing_item', count: t_cat.clothing_items.size)
      end

      it 'allows users to add a clothing item to their closet' do
        expect(page).to have_link("Add to my closet")
        expect(page).to have_link("Bulk add")
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
    it 'index redirects to login screen' do
      visit categories_path

      expect(page).to have_text("Log in")
    end

    it 'show redirects to login screen' do
      t_cat = Category.find(3)
      visit category_path(t_cat)

      expect(page).to have_text("Log in")
    end
  end

end
