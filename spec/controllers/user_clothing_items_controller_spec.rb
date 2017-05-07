require 'rails_helper'

RSpec.describe UserClothingItemsController, type: :controller do

  let (:user) { FactoryGirl.create(:user) }

  render_views

  context 'logged in user' do

    before do
      login_with(user)
    end

    xit 'adds a new clothing item to current user' do
      # TODO write this spec
    end

  end

end
