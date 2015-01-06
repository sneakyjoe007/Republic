class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :EIN 
    devise_parameter_sanitizer.for(:account_update) << :name

  end

  def organization_login_required
    if current_organization
      return
    else
      access_denied
    end
  end

  def access_denied
      flash[:alert] = "Access Denied"
      redirect_to root_url and return
  end  
end
