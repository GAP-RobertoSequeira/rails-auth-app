class DashboardController < ApplicationController
  before_action :authenticate_user!

  before_action :find_user, only: [:roles, :update]

  def index
    @users = User.all
  end

  def roles
    @apps = App.includes(:roles).all
  end

  def update

    apps = App.where(id: user_params[:app_ids].reject!(&:blank?))
    roles = Role.where(id: user_params[:role_ids].reject!(&:blank?))

    if @user.update(roles: roles, apps: apps)
      redirect_to user_roles_url(@user), notice: 'User was successfully updated.'
    else
      redirect_to user_roles_url(@user), alert: 'Something went wrong'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(app_ids: [], role_ids: [])
  end
end
