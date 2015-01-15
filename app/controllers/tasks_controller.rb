class TasksController < ApplicationController
  before_action :set_project, only: [:new, :update, :create, :destroy, :edit]
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :set_users, only: [:new, :edit]
  before_action :authenticate_user!

  def new
    @task = @project.tasks.build
  end

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to @project
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_users
      @users = User.all
    end

    def task_params
      params.require(:task).permit(:title, :description, :deadline, :is_completed, :user_id)
    end
end
