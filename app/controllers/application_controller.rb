class ApplicationController < ActionController::API
  include ExceptionHandler
  before_action :verify_content_type

  def verify_content_type
    return if request.headers['Content-Type'] == 'application/json'

    render json: { errors: [ { "type": "invalid", "message": "Unsupported media type" } ] }, status: :unsupported_media_type
  end
end
