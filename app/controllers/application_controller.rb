class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ErrorResponseActions
  rescue_from CanCan::AccessDenied, :with => :authorization_error
  rescue_from ActiveRecord::RecordNotFound, :with => :resource_not_found

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def current_ability
    @current_ability ||= Ability.new(current_user, session[:employee_id])
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
