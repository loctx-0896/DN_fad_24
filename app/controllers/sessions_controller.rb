class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      check_activated? user
    else
      flash[:danger] = t "controllers.sessions.login_fail"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def check_activated? user
    if user.active?
      log_in user
      check_rememberme user
      flash[:success] = t "controllers.sessions.login_success"
      redirect_back_or store_location || root_path
    else
      flash[:warning] = t "controllers.sessions.account_notactive"
      redirect_to root_url
    end
  end

  def check_rememberme user
    return remember user if params[:session][:remember_me] == Settings.remember
    forget user
  end
end
