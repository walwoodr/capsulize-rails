require 'rails_helper'

RSpec.feature "Clothing Items", type: :feature do
  let (:user) { FactoryGirl.create(:user) }

  describe 'user logged in' do
    before do
      login_as(user)
    end

    describe 'index page' do
      before do

      end

      it 'displays a list of clothing items by category' do

      end

      it 'allows a user to remove a clothing item from their closet' do

      end

      it 'displays a link for a user to add a new item' do

      end
    end

    describe 'add/create item' do
      it 'displays fields to add item' do

      end

      it 'adds a new item in the user\'s closet' do

      end
    end
  end

  describe 'admin' do
    xit 'allows editing clothing items' do
      # eventually
    end
  end

  describe 'user not logged in' do
    it 'index redirects to login screen' do

    end

    it 'add redirects to login screen' do

    end
  end

end
