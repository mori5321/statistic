require "statistic/version"

module Statistic
  class Base
    def initialize(nums)
      @nums = nums
    end

    attr_reader :nums

    # 平均
    def average
      nums.reduce(:+) / nums.length
    end

    # 偏差: 平均からの差異
    def deviations
      nums.map {|num| num - average }
    end

    # 分散: 偏差の2乗和の平均
    def variances
      results = deviations.map {|dev| dev ** 2 }
      results.reduce(:+) / results.length
    end


    private
    # 二乗平方根: 絶対値取得
    def square_and_square_root(num)
      (num ** 2) ** (1 / 2.0)
    end
  end

  # 正規表現
  class StandardDeviation < Statistic::Base
    # 正規分布
    def calc
      variances ** (1 / 2.0)
    end

    # 95%信頼区間: 正規分布の2倍の範囲内に入るかどうか
    def within_95_percent?(data)
      within_n_deviation?(2, data)
    end

    private
    def within_n_deviation?(n, data)
      data_deviation = data - average
      square_and_square_root(data_deviation) <= calc * n
    end
  end
end

