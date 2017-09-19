class TaskEntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.where(user_id: current_user.id)
  end

  def new
    @task_entry = TaskEntry.new
  end

  def create
    @task_entry = TaskEntry.new(task_entry_params)

    if @task_entry.save
      redirect_to task_entries_path
    else
      @errors = @task_entry.errors.full_messages
      render 'new'
    end
  end

  def edit
    @task_entry = TaskEntry.find(params[:id])
  end

  def update
    @task_entry = TaskEntry.find(params[:id])
    
    if @task_entry.update(task_entry_params)
      redirect_to task_entries_path
    else
      @errors = @task_entry.errors.full_messages
    end
  end

  private
    def task_entry_params
      te_params = params.require(:task_entry)
      te_params.merge!(task_id: Task.find_by(task_name: params[:task]).id)
      te_params.permit(:task_id, :duration, :note, :start_time)
    end

end
