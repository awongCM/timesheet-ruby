class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :check_user_profile, :store_session_variables

  private

  ##TODO - global helper file
  def check_user_profile
    if(current_user)
      @hasEmployeeRecord ||= Employee.exists?(:user_id => current_user.id)
      if !@hasEmployeeRecord
        flash.now[:alert] = "Employee id is missing"
      else
        flash.now[:notice] = "Current Employee"
      end
    end
  end

  def store_session_variables
    if (current_user)
      @session_employee_id ||= Employee.find_by(user_id: current_user.id).id   
    end
  end


  protected

  def configure_permitted_parameters
      attributes = [:username, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: attributes
      devise_parameter_sanitizer.permit :account_update, keys: attributes
  end

  def after_sign_in_path_for(resource)
    profile_index_path
  end

end
