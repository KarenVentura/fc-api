class SalaryCalculator
  attr_reader :player, :player_team_scores, :level_key

  def initialize(player, player_team_scores)
    @player = player
    @player_team_scores = player_team_scores
    @level_key = player.nivel.to_sym
  end

  def total_salary
    player.sueldo + variable_bonus
  end

  def variable_bonus
    bonus = (individual_goal_percentage + goal_per_team_percentage) / 2
    (bonus * player.bono) / 100
  end

  def individual_goal_percentage
    percentage = (100 / goals_per_level[level_key]) * player.goles
    validate_percentage(percentage)
  end

  def goal_per_team_percentage
    percentage = (100 / team_goals_to_score) * team_goals_scored
    validate_percentage(percentage)
  end

  def validate_percentage(percentage)
    percentage > 100 ? 100 : percentage
  end

  def team_goals_to_score
    player_team_scores[:goals_to_score]
  end

  def team_goals_scored
    player_team_scores[:goals_scored]
  end

  def goals_per_level
    @goals_per_level ||= GoalsPerLevel.fetch
  end
end
