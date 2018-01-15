class ProfileController < ApplicationController
  load_and_authorize_resource :employee, :parent => false 

  def index
    #fetch current employee based on logged in user
    @employee = Employee.find_by(user_id: current_user.id)
  end

  def new

    @employee = Employee.new
    @profile_url_path = profile_index_path

  end

  def edit

    @employee = Employee.find(params[:id])
    @profile_url_path = profile_path
    
  end
  
  def create
    # Assumed a logged in user can only create one employee profile for himself/herself.
    @employee = Employee.new(employee_params)
    @employee.save

    session[:employee_id] = @employee.id
    
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
      params.require(:employee).permit(:title, :first_name, :last_name, :date_of_birth, :job_title, :gender, :address).merge(user_id: current_user.id)
  end


end