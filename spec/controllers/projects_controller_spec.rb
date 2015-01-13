require 'rails_helper'

describe ProjectsController do

  describe 'GET #index' do
    it 'renders successfully' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'renders successfully' do
      get :index, id: create(:project)
      expect(response).to have_http_status(:success)
    end
  end

end