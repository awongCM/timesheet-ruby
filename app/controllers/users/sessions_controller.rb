class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    begin
      session[:employee_id] = Employee.find_by(user_id: current_user.id).id  
    rescue
      # if can't find existing employee
      session[:employee_id] = nil
    end
    
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
    flash.delete(:notice)
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
