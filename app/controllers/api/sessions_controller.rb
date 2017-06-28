class Api::SessionsController < ApiController

  skip_before_action :authenticate_user!, only: [:create]

  def create
    user = User.find_for_database_authentication(email: user_params[:email])

    if user_params[:app] && user && user.valid_password?(user_params[:password])
      render json: {
        auth_token: JWTWrapper.encode(
          {
            user_id: user.id,
            roles: user.active_roles(user_params[:app]).map(&:name)
          }
        ),
        user: {id: user.id, email: user.email}
      }
    else
      render json: {status: 401, message: 'Invalid email, password or app'}, status: 401
    end
  end

  protected

  def user_params
    @user_params ||= params.require(:user).permit(:email, :password, :app)
  end

end
