require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

    let (:user) { FactoryGirl.create(:user) }
    let (:pants) { FactoryGirl.create(:pants)}
    let (:shirts) { FactoryGirl.create(:shirts)}
    let (:jeans) { FactoryGirl.create(:jeans, category: pants) }
    let (:tshirt) { FactoryGirl.create(:tshirt, category: shirts) }
    let (:outfit) { FactoryGirl.create(:outfit, user: user, clothing_items: [jeans, tshirt]) }
    let (:user_2) { FactoryGirl.create(:user_2) }

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
end
