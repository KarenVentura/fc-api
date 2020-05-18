class Team
  attr_reader :teams, :params

  def initialize(params)
    @params = params.map(&:to_h)
    @teams = {}
    calculate_team_score_goals
  end

  def calculate_team_score_goals
    params.each do |player|
      player = player.with_indifferent_access
      name = player[:equipo]
      player_level = player[:nivel].to_sym

      if teams[name].present?
        teams[name][:goals_scored] = teams[name][:goals_scored] + player[:goles]
        teams[name][:goals_to_score] = teams[name][:goals_to_score] + goals_per_level[player_level]
      else
        teams[name] = {}
        teams[name][:goals_scored] = player[:goles]
        teams[name][:goals_to_score] = goals_per_level[player_level]
      end
    end
  end

  def fetch(name)
    teams[name]
  end

  def goals_per_level
    @goals_per_level ||= GoalsPerLevel.fetch
  end
end
