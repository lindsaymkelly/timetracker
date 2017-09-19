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
    @task_entry.start_time = Time.current

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
      render 'edit'
    end
  end

  def stop_timer
    
    @task_entry = TaskEntry.find(params[:id])

    if !@task_entry.duration.present?
      debugger
      time_spent = (Time.parse(Time.current.strftime("%I:%M:%S %p")) - Time.parse(@task_entry.start_time.strftime("%I:%M:%S %p")))
      @task_entry.duration = time_spent

      if @task_entry.save
        redirect_to task_entries_path
      else
        @errors = @task_entry.errors.full_messages
        @tasks = Task.where(user_id: current_user.id)
        render 'index'
      end
    else
      @errors = ["Can't stop timer for task entry that has already been stopped"]
      @tasks = Task.where(user_id: current_user.id)
      render 'index'
    end
  end

  private
    def task_entry_params
      te_params = params.require(:task_entry)
      te_params.merge!(task_id: Task.find_by(task_name: params[:task]).id)
      te_params.permit(:task_id, :duration, :note, :start_time)
    end

end
