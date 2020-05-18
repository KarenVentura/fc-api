require "test_helper"

class GoalsPerLevelTest < ActiveSupport::TestCase
  test "fetch a hash with goals per level" do
    assert_equal Hash, GoalsPerLevel.fetch.class
    assert_equal goals_level, GoalsPerLevel.fetch
  end

  test "fetch minimum goals by specific level" do
    assert_equal 15, GoalsPerLevel.minimum_goals_per_level(:C)
    assert_equal 5, GoalsPerLevel.minimum_goals_per_level(:A)
  end

  def goals_level
    {
      A: 5,
      B: 10,
      C: 15,
      Cuauh: 20
    }
  end
end
