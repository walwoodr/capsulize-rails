require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

    let (:user) { FactoryGirl.create(:user) }

    render_views

    context 'logged in user' do

      before do
        login_with(user)
      end

      it 'index action renders index template' do
        get :index

        is_expected.to render_template :'categories/index'
      end
    end


    context 'guest' do
      xit 'clothing_item path redirects to homepage' do
        get :index

        is_expected.to redirect_to home_path
      end
    end

    context 'admin' do
      # TODO later
    end
    
end
