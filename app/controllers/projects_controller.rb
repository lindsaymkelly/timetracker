class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to root_path
    else
      @errors = @project.errors.full_messages
      render 'new'
    end
  end

  private
    def project_params
      proj_params = params.require(:project)
      proj_params.merge!(customer_id: Customer.find_by(company: params[:customer]).id)
      proj_params.permit(:project_name, :customer_id)
    end
end
