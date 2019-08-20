class UsersController < ApplicationController
  before_action :load_user,:authenticate_user!, only: :show

  def show; end
  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "controllers.users.login_please"
    redirect_to root_path
  end
end
