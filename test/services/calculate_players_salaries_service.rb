require "test_helper"

class CalculatePlayersSalariesServiceTest < ActiveSupport::TestCase
  test "fetch an array of players with their full calculated salary" do
    players_response = CalculatePlayersSalariesService.new(players).execute

    assert_equal Array, players_response.class
    assert_equal player_with_his_full_calculated_salary, players_response.first.as_json
  end

  def player_with_his_full_calculated_salary
    {
      "nombre" => "Juan Perez",
      "goles_minimos" => 15,
      "goles" => 10,
      "sueldo" => 50000,
      "bono" => 25000,
      "sueldo_completo" => 67825.0,
      "equipo" => "rojo"
    }
  end
end
