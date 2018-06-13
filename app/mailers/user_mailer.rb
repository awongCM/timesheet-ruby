# TODO - furthe email implementation
class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:4000/user/login'
    mail(to: @user.email, subject: 'Welcome to your Timesheet Ruby System')
  end
end
