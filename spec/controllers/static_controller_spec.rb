require 'rails_helper'

RSpec.describe StaticController, type: :controller do

  it 'displays home page' do
    get :home

    is_expected.to render_template :'static/home'
  end

end
