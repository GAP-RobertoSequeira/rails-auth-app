require 'devise/controllers/helpers'

class Api::SessionsController < ApiController

  skip_before_action :authenticate_user!, only: [:create]

  def create
    user = User.find_for_database_authentication(email: user_params[:email])

    if user && user.valid_password?(user_params[:password])
      render json: {
        auth_token: JWTWrapper.encode({user_id: user.id}),
        user: {id: user.id, email: user.email}
      }
    else
      render json: { status: 401, message: 'Invalid email or password'}, status: 401
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
