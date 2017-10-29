class ProfileController < ApplicationController
  def index
    #fetch current employee based on logged in user
    @employee = Employee.find_by(user_id: current_user.id)
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end
  
  def create

    @employee = Employee.new(employee_params)
    @employee.save

    redirect_to profile_index_path
  end

  def update

    @employee = Employee.find(params[:id])
    
    if @employee.update(employee_params)
        redirect_to profile_index_path
    else
        render 'edit'
    end
    
  end
  

  ## https://stackoverflow.com/questions/16530532/rails-4-insert-attribute-into-params

  private
  def employee_params
      params.require(:employee).permit(:title, :first_name, :last_name).merge(user_id: current_user.id)
  end


end