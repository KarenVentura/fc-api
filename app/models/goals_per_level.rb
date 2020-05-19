class GoalsPerLevel
  def minimum_required(level)
    goals_per_level[level.to_sym]
  end

  def goals_per_level
    {
      A: 5,
      B: 10,
      C: 15,
      Cuauh: 20
    }
  end
end
