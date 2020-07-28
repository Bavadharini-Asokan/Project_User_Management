class ProjectsController < ApplicationController
  def index
    @project = Project.select('projects.id','projects.project_name','departments.department_name').joins(:department)
  end
  def new
    @project = Project.new
  end
  def create
    @project =  Project.new(params.require(:project).permit(:project_name,:department_id))
      if @project.save
        redirect_to projects_path
      else
        render 'new'
      end
  end
  def show
    @projectid = params[:id]
    @projectuser = ProjectsUser.where(:project_id => params[:id])
    @department = params[:department]
  end
  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to projects_path
  end
end
