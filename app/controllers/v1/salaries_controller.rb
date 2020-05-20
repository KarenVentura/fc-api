# frozen_string_literal: true

module V1
  class SalariesController < ApplicationController
    before_action :validate_schema

    def index
      response = CalculatePlayersSalariesService.new(player_params).execute

      if response.success?
        render json: response.entity.as_json, status: :ok
      else
        render json: {
          errors: [ { "type": "error interno", "message": "Error interno en el servidor. Estamos solucionando el problema, porfavor regresa más tarde" } ]
        }, status: :internal_server_error
      end
    end

    def player_params
      params.permit('_json': [:nombre, :nivel, :goles, :sueldo, :bono, :sueldo_completo, :equipo])["_json"]
    end

    private

    def validate_schema
      schema = {
        "required" => ["nombre", "nivel", "goles", "sueldo", "bono", "sueldo_completo", "equipo"],
        "properties" => {
          "goles" => { "type" => "integer"},
          "sueldo" => { "type" => "float"},
          "bono" => { "type" => "float"}
        }
      }

      JSON::Validator.validate!(schema, player_params.as_json, :list => true)
    rescue => exception
      render json: {
        errors: [ { "type": "inválido", "message": "Estructura del JSON incorrecta, favor de verificar los valores" } ]
      }, status: :unprocessable_entity
    end
  end
end
