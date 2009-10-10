# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :super_authenticate

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      Admin.find_by_email_and_password(username, password)
    end
  end
  
  def super_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      user = Admin.find_by_email_and_password(username, password)
      user && user.super_admin?
    end
  end

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
end
