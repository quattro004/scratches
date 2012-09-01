class UserMailer < ActionMailer::Base
  default from: "mailman@recipieces.com"

  def registration_email(user)
    @user = user
    mail(:to => "quattro004@gmail.com", :subject => "New User Registration")
  end
end
