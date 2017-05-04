require 'rails_helper'

RSpec.describe OutfitsController, type: :controller do

  let (:user) { FactoryGirl.create(:user) }
  let (:pants) { FactoryGirl.create(:pants)}
  let (:shirts) { FactoryGirl.create(:shirts)}
  let (:jeans) { FactoryGirl.create(:jeans, category: pants) }
  let (:tshirt) { FactoryGirl.create(:tshirt, category: shirts) }
  let (:outfit) { FactoryGirl.create(:outfit, user: user, clothing_items: [jeans, tshirt]) }

  context 'logged in user' do

    before do
      login_with(user)
    end

    it 'root renders outfit index' do
      get root_path

      is_expected.to respond_with :ok
      is_expected.to render_with_layout :application
      is_expected.to render_template :'outfits/index'
    end

    it 'index action renders index template' do
      get outfits_path

      is_expected.to respond_with :ok
      is_expected.to render_with_layout :application
      is_expected.to render_template :'outfits/index'
    end

    it 'show action renders show template' do
      get outfit_path(outfit)

      is_expected.to respond_with :ok
      is_expected.to render_with_layout :application
      is_expected.to render_template :'outfits/show'
    end

    it 'edit action renders edit template' do
      get edit_outfit_path(outfit)

      is_expected.to respond_with :ok
      is_expected.to render_with_layout :application
      is_expected.to render_template :'outfits/edit'
    end

    it 'edit action renders form partial' do
      get edit_outfit_path(outfit)

      expect(response).to render_template(partial: 'outfits/form')
    end

    xit 'update action redirects to show' do
      #
    end

    xit 'update action renders edit template if invalid input' do
      #
    end

    it 'new action renders new template' do
      get new_outfit_path(outfit)

      is_expected.to respond_with :ok
      is_expected.to render_with_layout :application
      is_expected.to render_template :'outfits/new'
    end

    it 'new action renders form partial' do
      get new_outfit_path(outfit)

      expect(response).to render_template(partial: 'outfits/form')
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
    it 'outfits index redirects to homepage' do
      get outfits_path

      is_expected.to redirect_to new_session_path
      is_expected.to set_the_flash(:warning).to('Please log in.')
    end
  end

  context 'admin' do
    # TODO later
  end

end
