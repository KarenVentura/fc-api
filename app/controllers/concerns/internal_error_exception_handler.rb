# frozen_string_literal: true

# This ExceptionHandler class is for manage api exceptions
module InternalErrorExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Exception do |exception|
      Rails.logger.error "#{exception.class} #{exception.message}"

      render json: {
        errors: [ { "type": "error interno", "message": "Error interno en el servidor. Estamos solucionando el problema, porfavor regresa más tarde" } ]
      }, status: :internal_server_error
    end
  end
end
