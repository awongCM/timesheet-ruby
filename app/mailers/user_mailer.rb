# TODO - require further email implementation
class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def send_welcome_email(user)
    @user = user
    @url  = 'http://localhost:4000/user/login'
    mail(to: @user.email, subject: 'Welcome to your Timesheet Ruby System')
  end

  # TODO - receive emails yet.. - https://guides.rubyonrails.org/action_mailer_basics.html#receiving-emails
  def receive(email)
    page = Page.find_by(address: email.to.first)
    page.emails.create(
      subject: email.subject,
      body: email.body
    )

    if email.has_attachments?
      email.attachments.each do |attachment| 
        page.attachments.create({
          file: attachment,
          description: email.subject
        })
      end      
    end
  end
  
end
