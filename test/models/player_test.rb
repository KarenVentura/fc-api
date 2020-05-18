require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  setup do
    @player = Player.new(players.first)
  end

  test "create a player object" do
    assert_equal Player, @player.class
  end

  test "serialized keys of player object" do
    assert_equal selialized_player_params.keys, @player.as_json.keys.map(&:to_sym)
  end

  def selialized_player_params
    {
      "nombre": "Juan Perez",
      "goles_minimos": 15,
      "goles": 10,
      "sueldo": 50000,
      "bono": 25000,
      "sueldo_completo": nil,
      "equipo": "rojo"
   }
  end
end
