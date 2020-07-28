class UsersController < ApplicationController
  def index
    @user = User.select('users.id','users.first_name','users.last_name','departments.department_name').joins(:department)
  end
  def show
    @userid = params[:id]
    @projectuser = ProjectsUser.where(:user_id => params[:id]).distinct
    @department = params[:department]
  end
  def new
    @user = User.new
  end
  def create
    @user =  User.new(params.require(:user).permit(:first_name,:last_name,:department_id))
      if @user.save
        redirect_to users_path
      else
        render 'new'
      end
  end
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
end
