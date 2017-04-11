class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for resource
    if resource.class == Donor
      "/donor/dashboard"
    elsif resource.class == Bank
      "/bank/dashboard"
    elsif resource.class == Hospital
      "/hospital/dashboard"
    end
  end

  def after_sign_out_path_for resource
    if resource.to_s == "donor"
      "/donors/sign_in"
    elsif resource.to_s == "bank"
      "/banks/sign_in"
    elsif resource.to_s == "hospital"
      "/hospitals/sign_in"
    end
  end
  
  protected

  def configure_permitted_parameters
    added_attrs = [:username, :name, :address, :password, :password_confirmation, :age, :sex, :phone_no, :full_name, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
