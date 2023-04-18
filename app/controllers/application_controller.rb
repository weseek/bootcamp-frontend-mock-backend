class ApplicationController < ActionController::API
  before_action :underscore_root_keys

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActiveRecord::RecordInvalid, with: :render_400

  def underscore_root_keys
    params.transform_keys!(&:underscore)
  end

  def render_404
    render json: {error: 'Bad request'}, status: :not_found
  end

  def render_400(e)
    render json: {error: e}, status: :bad_request
  end
end
