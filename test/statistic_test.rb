require "test_helper"

class StatisticTest < Minitest::Test
  def setup
    ary = [6,4,6,6,6,3,7,2,2,8]
    @sd = Statistic::Base.new(ary)
  end

  def test_average
    assert_equal 5, @sd.average
  end

  def test_deviations
    assert_equal [1, -1, 1, 1, 1, -2, 2, -3, -3, 3], @sd.deviations
  end

  def test_variances
    assert_equal @sd.variances, 4
  end
end

class StandardDeviationTest < Minitest::Test
  def setup
    ary = [6,4,6,6,6,3,7,2,2,8]
    @sd = Statistic::StandardDeviation.new(ary)
  end

  def test_calc
    assert_equal 2, @sd.calc
  end

  # 95%信頼区間: 標準偏差の2倍の中に入るか?
  # average +- sd
  # =  (5 + 2 * 2) ~ (5 - 2 * 2)  = 1 ~ 9
  def test_within_95_percent?
    assert @sd.within_95_percent?(1.0)
    refute @sd.within_95_percent?(0.9)
    assert @sd.within_95_percent?(9.0)
    refute @sd.within_95_percent?(9.1)
  end
end