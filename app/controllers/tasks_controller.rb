class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path
    else
      @errors = @task.errors.full_messages
      render 'new'
    end
  end

  private
    def task_params
      t_params = params.require(:task)
      t_params.merge!(project_id: Project.find_by(project_name: params[:project]).id)
      t_params.merge!(user_id: current_user.id)
      t_params.permit(:project_id, :user_id, :task_name)
    end
end
