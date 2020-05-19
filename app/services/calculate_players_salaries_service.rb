class CalculatePlayersSalariesService < BaseService
  attr_reader :player_params, :team, :players

  def initialize(player_params)
    @success = true
    @player_params = player_params
    @team = Team.new(player_params)
    @players = []
  end

  def execute
    player_params.each do |player|
      player_team = team.find_by_name(player["equipo"])
      player_obj = build_player(player, player_team)

      players << player_obj
    end

    players
    build_response(players, @success)
  end

  private

  def build_player(player, player_team)
    player = Player.new(player)
    player.sueldo_completo = total_salary(player, player_team)
    player.goles_minimos = minimum_goals_per_level(player.nivel)
    player
  rescue => exception
    recover_from_exception(exception)
    @success = false
    nil
  end

  def total_salary(player, player_team_scores)
    SalaryCalculator.new(player, player_team_scores).total_salary
  end

  def minimum_goals_per_level(level)
    GoalsPerLevel.new.minimum_required(level.to_sym)
  end
end
