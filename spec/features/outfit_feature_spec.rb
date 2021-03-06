require 'rails_helper'

RSpec.describe 'Outfit', type: :feature do
  describe 'user logged in' do
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
        expect(page).to have_link("New Outfit", {href: new_user_outfit_path(user)})
        expect(page).to have_css('a.button-link')
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
        expect(page).to have_link("Edit outfit", {href: edit_user_outfit_path(user, outfit)})
      end

      xit 'displays a link to riff on the outfit (duplicate & modify)' do
        expect(page).to have_link("Riff off the outfit", {href: new_by_duplicate_user_outfit_path(user, outfit)})
      end
    end

    describe 'new outfit page' do
      before do
        visit new_user_outfit_path(user)
      end

      it 'displays a form to create a new outfit' do
        expect(page).to have_css('form#new_outfit')
      end

      it 'displays clothes options by category' do #duplicated by edit outfit page spec
        expect(page).to have_text(category.name)
        expect(page).to have_css("div.#{category.name}")
        expect(page).to have_css("div.#{category.name} div.clothing-item", count: category.clothing_items.users(user).size)
      end

      it 'allows you to create a new item of clothing with the outfit' do #duplicated by edit outfit page spec
        expect(page).to have_css('input#outfit_clothing_item_name')
        expect(page).to have_css('input#outfit_clothing_item_color')
      end

      describe 'form errors' do # duplicated by edit outfit page spec
        xit 'displays error if only 1 clothing item selected' do

        end

        xit 'does not display error if 1 item selected and new item invalid' do

        end

        xit 'does not display error if 1 item selected and new item valid' do

        end

        xit 'displays clothing item error if item invalid' do

        end
      end
    end

    describe 'new outfit creation' do
      describe 'without a new item' do
        before do
          visit new_user_outfit_path(user)
          fill_in "Outfit Name", with: "Evening at the Opera"
          check "outfit_clothing_item_ids_16"
          check "outfit_clothing_item_ids_4"
          click_button "Create Outfit"
        end

        let (:outfit_2) { user.outfits.find_by(name: "Evening at the Opera")}

        it 'creates a new outfit belonging to the user' do
          expect(outfit_2).not_to be_nil
          expect(user.outfits.last).to eq(outfit_2)
        end

        it 'redirects to view the new outfit' do
          expect(page).to have_text(outfit_2.name)
        end
      end

      describe 'create a new item with an outfit' do
        before do
          visit new_user_outfit_path(user)
          fill_in "Outfit Name", with: "Day at the ranch"
          check "outfit_clothing_item_ids_16"
          check "outfit_clothing_item_ids_4"
          fill_in "outfit_clothing_item_color", with: "blue"
          fill_in "outfit_clothing_item_name", with: "bolero tie"
          select "pants", from: "outfit[clothing_item][category_id]"
          click_button "Create Outfit"
        end

        it 'adds a new item to the user\'s closet' do
          bolero = user.clothing_items.find_by(name: "bolero tie")

          expect(bolero).to_not be_nil
        end
      end
    end

    describe 'outfit modification page' do
      before do
        visit edit_user_outfit_path(user, outfit)
      end

      it 'displays a form to change the existing outfit' do
        expect(page).to have_css('form.edit_outfit')
        expect(page).to have_selector("input[value='Night on the town']")
      end

      it 'displays a button to delete the outfit' do
        expect(page).to have_link("Delete outfit", {href: user_outfit_path(user, outfit)})
      end

      it 'displays clothes options by category' do #duplicate of new outfit page spec
        expect(page).to have_text(category.name)
        expect(page).to have_css("div.#{category.name}")
        expect(page).to have_css("div.#{category.name} div.clothing-item", count: category.clothing_items.users(user).size)
      end

      it 'allows you to create a new item of clothing on the outfit' do #duplicate of new outfit page spec
        expect(page).to have_css('input#outfit_clothing_item_name')
        expect(page).to have_css('input#outfit_clothing_item_color')
      end

      describe 'form errors' do # duplicate of new outfit page spec
        xit 'displays error if only 1 clothing item selected' do

        end

        xit 'does not display error if 1 item selected and new item invalid' do

        end

        xit 'does not display error if 1 item selected and new item valid' do

        end

        xit 'displays clothing item error if item invalid' do

        end
      end
    end

    describe 'modify outfit' do
      let(:outfit_count) {user.outfits.size}
      let(:old_name) {outfit.name}

      before do
        visit edit_user_outfit_path(user, outfit)
        fill_in "Outfit Name", with: "Night on the town - best"
        uncheck "outfit_clothing_item_ids_16"
        check "outfit_clothing_item_ids_24"
        click_button "Update Outfit"
        # NOTE outfit should have items 24 and 4 and NOT 16
      end

      let(:changed_outfit) { user.outfits.find_by(name: "Night on the town - best")}

      it 'changes the outfit belonging to the user' do
        expect(user.outfits.size).to eq(outfit_count)
        expect(changed_outfit).not_to be_nil
        expect(user.outfits.find_by(name: old_name)).to be_nil
      end

      it 'updates the clothing items on the outfit' do
        expect(changed_outfit.clothing_item_ids).to include(24)
        expect(changed_outfit.clothing_item_ids).not_to include(16)
      end

      it 'redirects to view the show outfit page' do
        expect(page).to have_text(changed_outfit.name)
        expect(page).to have_link("Edit outfit", {href: edit_user_outfit_path(user, outfit)})
      end
    end

    describe 'outfit deletion' do
      let(:outfit_count) {user.outfits.size}
      let(:outfit_name) {outfit.name}

      before do
        visit edit_user_outfit_path(user, outfit)
        click_link "Delete outfit"
      end

      let(:deleted_outfit) { user.outfits.find_by(name: outfit_name)}

      it 'deletes the outfit' do
        expect(deleted_outfit).to be_nil
      end

      it 'redirects to the outfit index page' do
        expect(page).to have_text("your outfits")
      end
    end

  end

  describe 'user not logged in' do
    before do
      visit user_outfits_path(user_id: 1)
    end

    it 'renders an error message' do
      expect(page).to have_text("You need to sign in or sign up before continuing.")
    end
  end

end
