class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  def parameter_missing(e)
    render json: { error: e.message }, status: :bad_request
  end
end
