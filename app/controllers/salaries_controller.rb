class SalariesController < ApplicationController
  def update
    players = CalculatePlayersSalariesService.new(player_params).fetch
    render json: players.as_json , status: :ok
  end

  def player_params
    params.permit('_json': [:nombre, :nivel, :goles, :sueldo, :bono, :sueldo_completo, :equipo])["_json"]
  end
end
