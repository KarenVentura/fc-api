class CalculatePlayersSalariesService
  attr_reader :player_params, :team, :players, :success

  def initialize(player_params)
    @success = true
    @player_params = player_params
    @team = Team.new(player_params)
    @players = []
  end

  def fetch
    player_params.each do |player|
      player = Player.new(player)
      team_player = team.fetch(player.equipo)
      player.sueldo_completo = total_salary(player, team_player)
      player.goles_minimos = minimum_goals_per_level(player.nivel)
      players << player
    end

    players
  end

  private

  def total_salary(player, player_team_scores)
    SalaryCalculator.new(player, player_team_scores).total_salary
  end

  def minimum_goals_per_level(level)
    GoalsPerLevel.new.minimum_required(level.to_sym)
  end
end
