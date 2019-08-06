class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user&.unactive? && user.authenticated?(:activation, params[:id])
      user.active!
      log_in user
      flash[:success] = t "controllers.account.success"
      redirect_to user
    else
      flash[:danger] = t "controllers.account.invalid_link"
      redirect_to root_url
    end
  end
end
