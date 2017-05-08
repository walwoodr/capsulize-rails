require 'rails_helper'

RSpec.feature "Clothing Items", type: :feature do
  let (:user) { FactoryGirl.create(:user) }
  let (:pants) { FactoryGirl.create(:pants) }
  let (:jeans) { FactoryGirl.create(:jeans, category: pants) }

  describe 'user logged in' do
    before do
      login_as(user)
      user.user_clothing_items.find_or_create_by(clothing_item_id: jeans.id)
    end

    describe 'index page' do
      before do
        visit clothing_items_path
      end

      it 'displays a list of clothing items by category' do
        expect(page).to have_text("Pants")
        expect(page).to have_text("#{jeans.name} | #{jeans.color} | ")
      end

      it 'allows a user to remove a clothing item from their closet' do
        click_link("remove")

        expect(page).to have_text("#{jeans.color} #{jeans.name} have been removed from your closet")
        expect(page).not_to have_text("#{jeans.name} | #{jeans.color} | ")
      end

      it 'displays a link for a user to add a new item' do
        expect(page).to have_link("Create new item")
      end
    end

    describe 'new outfit creation' do
      before do
        visit clothing_items_path
        click_link("Create new item")
        fill_in "Clothing Item Name", with: "Leggings"
        fill_in "Color", with: "silver"
        fill_in "fanciness", with: "4"
        select "pants", from: "Categories"
        click_button "Create Clothing Item"
      end

      it 'adds a new item in the user\'s closet' do
        leggings = user.clothing_items.last

        expect(leggings).not_to be_nil
        expect(leggings.name).to eq("Leggings")
        expect(leggings.color).to eq("silver")
        expect(leggings.fanciness).to eq(4)
        expect(page).to have_text("Leggings | silver")
      end
    end
  end

  describe 'admin' do
    xit 'allows editing clothing items' do
      # eventually
    end
  end

  describe 'user not logged in' do
    it 'index redirect renders an error message' do
      visit clothing_items_path

      expect(page).to have_text("You need to sign in or sign up before continuing.")
    end

    it 'add redirect renders an error message' do
      visit new_clothing_item_path

      expect(page).to have_text("You need to sign in or sign up before continuing.")
    end
  end
end
