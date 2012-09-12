class UserMailer < ActionMailer::Base
  default from: "mailman@recipieces.com"

  def registration_email(user)
    @user = user
    mail(:to => APP_CONFIG['webmaster_email'], :subject => "New User Registration")
  end
end
