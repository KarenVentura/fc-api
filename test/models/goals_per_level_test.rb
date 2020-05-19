require "test_helper"

class GoalsPerLevelTest < ActiveSupport::TestCase
  test "fetch minimum goals by specific level" do
    assert_equal 15, GoalsPerLevel.new.minimum_required(:C)
    assert_equal 5, GoalsPerLevel.new.minimum_required(:A)
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
