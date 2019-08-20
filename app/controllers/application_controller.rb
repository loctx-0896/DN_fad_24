class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CartHelper

  before_action :config_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def admin_user
    return if current_user.admin?
    flash[:danger] = t "controllers.not_right"
    redirect_to root_path
  end

  def config_permitted_parameters
    register_attrs = [:name, :phone, :email, :password, :password_confirmation]
    update_attrs = [:name, :phone, :email, :password, :password_confirmation,
                    :picture]
    devise_parameter_sanitizer.permit :sign_up, keys: register_attrs
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
end
