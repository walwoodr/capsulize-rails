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

    describe 'new clothing item creation' do
      before do
        visit clothing_items_path
        click_link("Create new item")
        fill_in "Name", with: "Leggings"
      end

      it 'adds a valid new item to the user\'s closet' do
        fill_in "Color", with: "silver"
        fill_in "Fanciness", with: "4"
        select "pants", from: "clothing_item[category_id]"
        click_button "Create Clothing item"
        leggings = user.clothing_items.last

        expect(leggings).not_to be_nil
        expect(leggings.name).to eq("Leggings")
        expect(leggings.color).to eq("silver")
        expect(leggings.fanciness).to eq(4)
        expect(page).to have_text("Leggings | silver")
      end

      it 'does not add an invalid item to the user\'s closet' do
        fill_in "Fanciness", with: "4"
        click_button "Create Clothing item"

        expect(page).to have_text("Color can't be blank, Category can't be blank")
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
