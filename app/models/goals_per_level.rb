class GoalsPerLevel
  def self.fetch
    {
      A: 5,
      B: 10,
      C: 15,
      Cuauh: 20
    }
  end

  def self.minimum_goals_per_level(level)
    fetch[level]
  end
end
