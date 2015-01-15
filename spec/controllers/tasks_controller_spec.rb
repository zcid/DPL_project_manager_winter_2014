require 'rails_helper'

describe TasksController do

  describe 'GET #new' do
    let(:project) { create(:project) }
    it 'renders successfully' do
      get :new, project_id: project.id

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:project) { create(:project) }
    let(:task) { create(:task) }
    context 'task is not created due to validation' do
      it 'renders the new page' do
        post :create, project_id: project.id, task: { title: '' }

        expect(response).to render_template(:new)
      end
    end

    context 'project was saved and created' do
      it 'renders show page for the project' do
        post :create, project_id: project.id, task: attributes_for(:task)

        expect(response).to redirect_to(project_path(project.id))
      end
    end
  end



end
