require "test_helper"

class SalaryCalculatorTest < ActiveSupport::TestCase
  setup do
    @team = Team.new(players)
  end

  test "calculate the salary of Juan Perez" do
    juan_perez_params = players.first
    player = Player.new(juan_perez_params)

    player_team_scores = @team.find_by_name(player.equipo)
    assert_equal 67825.0 , SalaryCalculator.new(player, player_team_scores).total_salary
  end

  test "calculate the salary of El Rulo" do
    rulo_params = players.fourth
    player = Player.new(rulo_params)

    player_team_scores = @team.find_by_name(player.equipo)
    assert_equal 42450 , SalaryCalculator.new(player, player_team_scores).total_salary
  end

  test "calculate the salary of El Cuauh" do
    cuau_params = players.second
    player = Player.new(cuau_params)

    player_team_scores = @team.find_by_name(player.equipo)
    assert_equal 144700 , SalaryCalculator.new(player, player_team_scores).total_salary
  end
end
