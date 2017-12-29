class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # TODO - Authorization Error Handling
  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :check_user_profile, :store_session_variables

  # TODO - import helpers
  include ApplicationHelper

  private

  ##TODO - global helper file
  def check_user_profile
    if(current_user)
      @hasEmployeeRecord ||= userHasEmployeeProfile
      if !@hasEmployeeRecord
        flash.now[:alert] = "Employee id is missing"
      else
        flash.now[:notice] = "Current Employee"
      end
    end
  end

  # TODO - to properly store sesson variable for this
  def store_session_variables
    if (current_user)
      @employeeFound = userHasEmployeeProfile

      unless !@employeeFound
        @session_employee_id = Employee.find_by(user_id: current_user.id).id
      end
   
    end
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, @session_employee_id)
  end


  protected

  def configure_permitted_parameters
      attributes = [:username, :email, :password, :password_confirmation, :remember_me, :role]
      devise_parameter_sanitizer.permit :sign_up, keys: attributes
      devise_parameter_sanitizer.permit :account_update, keys: attributes
  end

  def after_sign_in_path_for(resource)
    profile_index_path
  end

end
