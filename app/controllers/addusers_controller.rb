class AddusersController < ApplicationController
  def new
    @projectid = params[:project_id]
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
end
