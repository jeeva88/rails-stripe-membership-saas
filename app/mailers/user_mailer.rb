class UserMailer < ActionMailer::Base
  default :from => "jeeva.company@gmail.com"
  
  def expire_email(user)
    mail(:to => user.email, :subject => "Subscription Cancelled")
  end
end