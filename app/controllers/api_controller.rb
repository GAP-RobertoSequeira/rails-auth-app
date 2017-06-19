class ApiController < ActionController::API

  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from ActionController::ParameterMissing, :with => :parameter_missing

  private

  def record_not_found
    render json: {
      status: 404,
      message: "Record not found",
    }, status: :not_found
  end

  def parameter_missing(ex)
    render json: {
      status: 400,
      message: ex.message
    }, status: :bad_request
  end
end
