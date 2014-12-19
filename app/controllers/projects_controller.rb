class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
  	@projects = Project.all
  end

  def show
  end

  def new
  	@project = Project.new
  end

  def create
  	@project = Project.new(project_params)
  	if @project.save
  		redirect_to @project
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @project.update_attributes(project_params)
  		redirect_to @project
  	else
  		render :edit
  	end
  end

  def destroy
  	@project.destroy
  	redirect_to projects_url
  end

  private
    def set_project
    	@project = Project.find(params[:id])
    end

    def project_params
    	params.require(:project).permit(:team, :title, :description, :deadline)
    end
end
