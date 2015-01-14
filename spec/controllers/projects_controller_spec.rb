require 'rails_helper'

describe ProjectsController do

  describe 'GET #index' do
    it 'renders successfully' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    render_views

    it 'renders successfully' do
      get :index, id: create(:project)
      expect(response).to have_http_status(:success)
    end

    context 'displaying tasks' do
      let(:project) { create(:project) }
      let!(:first_task) { create(:task, project: project) }

      before { create(:another_task, project: project) }

      it 'shows all tasks for a given project' do
        get :show, id: project
        expect(response).to render_template(:show)
        expect(assigns(:project).tasks).not_to be_empty 
        expect(assigns(:project).tasks.count).to eq 2
      end

      it 'shows a specific task for a given project' do    
        get :show, id: project
        expect(assigns(:project).tasks).not_to be_empty
        expect(response.body).to match first_task.title
      end
    end
    
  end

  describe 'PATCH #update' do
    let(:project) { create(:project) }
    context 'project is not updated due to validation' do
      it 'renders the edit page' do
        patch :update, id: project, project: { title: '' }

        expect(response).to render_template(:edit)
      end
    end

    context 'update of project is successful' do
      it 'render the show page for the project' do
        patch :update, id: project, project: { title: 'New Title' }

        expect(response).to redirect_to(assigns(:project))
      end
    end
  end

  describe 'GET #new' do
    it 'renders successfully' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end