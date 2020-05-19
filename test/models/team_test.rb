require "test_helper"

class TeamTest < ActiveSupport::TestCase
  setup do
    @team = Team.new(players)
  end

  test "fetch the Azul team score data" do
    assert_equal azul_team_score_data, @team.find_by_name("azul")
  end

  test "fetch the rojo team score data" do
    assert_equal rojo_team_score_data, @team.find_by_name("rojo")
  end

  def azul_team_score_data
    { goals_scored: 37, goals_to_score: 25 }
  end

  def rojo_team_score_data
    { goals_scored: 19, goals_to_score: 25 }
  end
end
