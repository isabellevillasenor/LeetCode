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

RSpec.describe StockProfit do
  describe '#max_profit' do
    it 'returns the maximum profit for a given list of prices' do
      stock_profit = StockProfit.new
      expect(stock_profit.max_profit([7, 1, 5, 3, 6, 4])).to eq(5)  # Buy at 1, sell at 6
    end

    it 'returns 0 if no profit can be made' do
      stock_profit = StockProfit.new
      expect(stock_profit.max_profit([7, 6, 4, 3, 1])).to eq(0)  # No profit, prices are decreasing
    end

    it 'returns the correct profit with a single day of prices' do
      stock_profit = StockProfit.new
      expect(stock_profit.max_profit([5])).to eq(0)  # No profit with only one price
    end

    it 'returns the correct profit when there is only one price dip' do
      stock_profit = StockProfit.new
      expect(stock_profit.max_profit([10, 7, 5, 8, 11, 9])).to eq(6)  # Buy at 5, sell at 11
    end
  end
end
