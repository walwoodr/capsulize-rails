require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let (:user) { FactoryGirl.create(:user) }

  render_views

  context 'logged in user' do

    before do
      login_with(user)
    end

    it 'biggest closet action renders biggest closet template' do
      get :biggest_closet

      is_expected.to render_template :'users/biggest_closet'
    end

  end

end
