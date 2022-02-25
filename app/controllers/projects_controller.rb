class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params) #params[:project])#project_params)
    
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash.now[:alert] = "Project has not been created."
      render "new"
    end
    # respond_to do |format|
    #   if @project.save
    #     format.html { redirect_to project_url(@project), notice: "Project has been created." }
    #     format.json { render :show, status: :created, location: @project }
    #   else
    #     format.html { render :new, status: :unprocessable_entity, alert: "Project has not been created." }
    #     format.json { render json: @project.errors, status: :unprocessable_entity }
    #   end
    # end

  end

  def show
    @project = Project.find(params[:id])
  end


  private
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
