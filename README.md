# Statistic

文系エンジニアが統計学の学習がてらにつくったgemです。

現在実装済みの機能
- 平均
- 偏差
- 分散
- 標準偏差
- 95%信頼区間判定

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'statistic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install statistic

## Usage

TODO: Write usage instructions here

``` samp.rb
ary = [6,4,6,6,6,3,7,2,2,8]

sd = Statistic::StandardDeviation.new(ary)


# 標準偏差
sd.calc
=> 2

# 95%信頼区間内判定
sd.within_95_percent?(1.0)
=> true

sd.within_95_percent?(0.9)
=> false

sd.within_95_percent?(9.0)
=> true

sd.within_95_percent?(9.1)
=> false

# 平均
sd.average
=> 4

# 偏差
sd.average
=> [1, -1, 1, 1, 1, -2, 2, -3, -3, 3]

# 分散
sd.variances
=> 4

```


## 統計についてメモ

### 偏差
各データの平均からの差分

### 分散
偏差の二乗の平均

### 標準偏差
分散の平方根 (≒ 偏差の絶対値の平均)

### 95%信頼区間
標準偏差の2倍の範囲内にそのデータが入るか否か



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/statistic. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Statistic project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/statistic/blob/master/CODE_OF_CONDUCT.md).
