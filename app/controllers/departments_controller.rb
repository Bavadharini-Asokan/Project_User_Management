class DepartmentsController < ApplicationController
  def index
    @department = Department.all
  end
  def new
    @department = Department.new
  end
  def create
    @department =  Department.new(params.require(:department).permit(:department_name))
      if @department.save
        redirect_to departments_path
      else
        render 'new'
      end
  end
end
