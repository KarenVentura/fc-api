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

  private

  def variable_bonus
    bonus = (individual_goal_percentage + goal_per_team_percentage) / 2
    ((bonus * player.bono) / 100.0).truncate(2)
  end

  def individual_goal_percentage
     (100.0 / goals_per_level[level_key]).truncate(2) * player.goles
  end

  def goal_per_team_percentage
   (100.0 / team_goals_to_score).truncate(2) * team_goals_scored
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
