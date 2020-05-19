# frozen_string_literal: true

module V1
  class SalariesController < ApplicationController
    before_action :validate_schema

    def index
      response = CalculatePlayersSalariesService.new(player_params).fetch
      render json: response.as_json , status: :ok
    end

    def player_params
      params.permit('_json': [:nombre, :nivel, :goles, :sueldo, :bono, :sueldo_completo, :equipo])["_json"]
    end

    private

    def validate_schema
      schema = {
        "required" => ["nombre", "nivel", "goles", "sueldo", "bono", "sueldo_completo", "equipo"]
      }

      JSON::Validator.validate!(schema, player_params.to_json, :list => true)
    rescue => exception
      render json: {
        errors: [ { "type": "inválido", "message": "Estructura del JSON incorrecta, favor de verificar los valores" } ]
      }, status: :unprocessable_entity
    end
  end
end
