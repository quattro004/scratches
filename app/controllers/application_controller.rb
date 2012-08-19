class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => exception.message + " Please login to continue."
  end
end
