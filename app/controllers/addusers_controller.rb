class AddusersController < ApplicationController
  def new
    @projectid = params[:project_id]
    @department = params[:department]
  end
  def create
    # render plain: params[:projects_user].inspect
    @project_user =  ProjectsUser.new(params.require(:projects_user).permit(:project_id,:user_id))
      if @project_user.save
        redirect_to project_path(@project_user.project_id)
      else
        render 'new'
      end
  end
  def destroy
    project = ProjectsUser.where(:project_id => params[:project_id]).where(:user_id => params[:user_id]).first
    project.destroy
    flash[:notice] = 'Removed from project'
    redirect_to project_path(:id => project.project_id)
  end
end
