require 'rails_helper'

RSpec.describe OutfitsController, type: :controller do

  context 'logged in user' do
    it 'root renders outfit index' do
      #
    end

    it 'index action renders index template' do
      #
    end

    it 'show action renders show template' do
      #
    end

    it 'edit action renders edit template' do
      #
    end

    it 'edit action renders form partial' do
      #
    end

    it 'update action redirects to show' do
      #
    end

    it 'update action renders edit template if invalid input' do
      #
    end

    it 'new action renders new template' do
      #
    end

    it 'new action renders form partial' do
      #
    end

    it 'create action redirects to show' do
      #
    end

    it 'create action renders new template if invalid input' do
      #
    end

    context 'destroy action' do
      it 'renders index' do
        #
      end

      it 'destroys the object' do
        #
      end
      it 'sets a flash message' do
        #
      end
    end
  end

  context 'guest' do
    it 'outfits index redirects to homepage' do
      #
    end
  end

  context 'admin' do
    # TODO later
  end

end

# What was the response status code?
# Did the controller render the expected template?
# Did the controller set any flash messages?
# Did the controller redirect the user to a new URL?
