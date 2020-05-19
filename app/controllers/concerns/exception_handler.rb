# frozen_string_literal: true

# This ExceptionHandler class is for manage api exceptions
module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Exception do |exception|
      Rails.logger.error "#{exception.class} #{exception.message}"
      render json: { errors: [ { "type": "internal error", "message": "Error interno en el servidor." } ] }, status: :internal_server_error
    end
  end
end
