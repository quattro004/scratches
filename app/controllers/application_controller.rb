  class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
end
