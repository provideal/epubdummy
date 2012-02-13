class ApplicationController < ActionController::Base

  protect_from_forgery :except => [:create , :update]

  before_filter :authenticate

  rescue_from CanCan::AccessDenied do |exception|
    head :forbidden
  end

  protected

  def current_user
    @current_user
  end
  helper_method :current_user

  def authenticate
    user = authenticate_with_http_basic do |username, password|
      user = User.where(login: username).first
      (user.present? and user.authenticate(password)) ? user : false
    end

    if user.present?
      @current_user = user
    else
      request_http_basic_authentication
    end
  end

end
