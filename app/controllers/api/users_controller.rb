class Api::UsersController < ApiController

  before_action :find_user, only: [:show]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name)
  end

end
