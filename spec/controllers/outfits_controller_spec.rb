require 'rails_helper'

RSpec.describe OutfitsController, type: :controller do

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

    it 'index action renders index template for current user' do
      get :index

      is_expected.to render_template :'outfits/index'
    end

    it 'index action for other user renders index template' do
      get :index, params: { user_id: user_2.id }

      is_expected.to render_template :'outfits/index'
    end

    it 'show action renders show template' do
      get :show, params: { id: outfit.id, user_id: user.id }

      is_expected.to render_template :'outfits/show'
    end

    it 'edit action renders edit template' do
      get :edit, params: { id: outfit.id, user_id: user.id }

      is_expected.to render_template :'outfits/edit'
    end

    it 'edit action renders form partial' do
      get :edit, params: { id: outfit.id, user_id: user.id }

      expect(response).to render_template(partial: 'outfits/_form')
    end

    xit 'update action redirects to show' do
      #
    end

    xit 'update action renders edit template if invalid input' do
      #
    end

    it 'new action renders new template' do
      get :new, params: { user_id: user.id }

      is_expected.to render_template :'outfits/new'
    end

    it 'new action renders form partial' do
      get :new, params: { user_id: user.id }

      expect(response).to render_template(partial: 'outfits/_form')
    end

    xit 'create action redirects to show' do
      #
    end

    xit 'create action renders new template if invalid input' do
      #
    end

    context 'destroy action' do
      xit 'renders index' do
        #
      end

      xit 'destroys the object' do
        #
      end

      xit 'sets a flash message' do
        #
      end
    end
  end

  context 'guest' do
    xit 'outfits path redirects to homepage' do
      get :index, params: { user_id: user.id }

      is_expected.to redirect_to home_path
    end
  end

  context 'admin' do
    # TODO later
  end

end
