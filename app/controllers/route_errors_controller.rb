# frozen_string_literal: true

class RouteErrorsController < ApplicationController
  skip_before_action :verify_content_type, only: %i[verify_error]

  def verify_error
    if unsupported_api_version
      fourth_twenty_two
    else
      fourth_zero_fourth
    end
  end

  private

  def fourth_zero_fourth
    render json: {
      errors: [ { "type": "invalido", "message": "Ruta no encontrada, porfavor verifique que la ruta sea la correcta" } ]
    }, status: :not_found
  end

  def  fourth_twenty_two
    render json: {
      errors: [ { "type": "invalido", "message": "Version no soportada, por el momento solo puedes acceder a la version 1" } ]
    }, status: :unprocessable_entity
  end

  def unsupported_api_version
    Mime::Type.parse(request.headers['Accept']).first.to_s != "application/vnd.fc.v1+json"
  end
end
