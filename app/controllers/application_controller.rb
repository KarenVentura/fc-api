# frozen_string_literal: true

class ApplicationController < ActionController::API
  include InternalErrorExceptionHandler
  before_action :verify_content_type

  def verify_content_type
    return if request.headers['Content-Type'] == 'application/json'

    render json: { errors: [ { "type": "invalido", "message": "Media type no soportado" } ] }, status: :unsupported_media_type
  end
end
