require 'rspec'

class StockProfit
  def max_profit(prices)
    min_price = Float::INFINITY
    max_profit = 0

    prices.each do |price|
      min_price = [min_price, price].min
      max_profit = [max_profit, price - min_price].max
    end

    max_profit
  end
end

