class AddprojectsController < ApplicationController
  def new
    @userid = params[:user_id]
    @department = params[:department]
  end
  def create
    @project_user =  ProjectsUser.new(params.require(:projects_user).permit(:project_id,:user_id))
      if @project_user.save
        redirect_to user_path(@project_user.user_id)
      else
        render 'new'
      end
  end
end
