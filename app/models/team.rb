class Team
  attr_reader :teams, :params

  def initialize(params)
    @params = params.map(&:to_h)
    @teams = {}
    @goals_scored = 0
    @goals_to_score = 0
    calculate_team_score_goals
  end

  def calculate_team_score_goals
    players_teams = params.group_by { |hash| hash["equipo"] }
    players_teams.each do |key_team, players|
      fetch_scores(players)

      teams[key_team] = { goals_scored: @goals_scored, goals_to_score: @goals_to_score }
      reset_values
    end
  end

  def find_by_name(name)
    teams[name]
  end

  def all
    teams
  end

  private

  def fetch_scores(players)
    players.each do |player|
      @goals_scored += player["goles"]
      @goals_to_score += goals_per_level.minimum_required(player["nivel"])
    end
  end

  def goals_per_level
    @goals_per_level ||= GoalsPerLevel.new
  end

  def reset_values
    @goals_to_score = 0
    @goals_scored = 0
  end
end
