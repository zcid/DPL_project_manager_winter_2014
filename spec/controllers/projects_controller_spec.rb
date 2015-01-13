require 'rails_helper'

describe ProjectsController do

  describe 'GET #index' do
    it 'renders successfully' do
      get :index
      # expect(response).to render_template('index')
      expect(response).to have_http_status(:success)
    end
  end

end