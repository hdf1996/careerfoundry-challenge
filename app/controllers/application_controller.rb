class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  def parameter_missing(error)
    render json: { error: error.message }, status: :bad_request
  end
end
