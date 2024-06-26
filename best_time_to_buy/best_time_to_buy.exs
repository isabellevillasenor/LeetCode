defmodule StockProfit do
  def max_profit(prices) do
    Enum.reduce(prices, {Enum.at(prices, 0, 0), 0}, fn price, {min_price, max_profit} ->
      new_min_price = min(min_price, price)
      new_max_profit = max(max_profit, price - new_min_price)
      {new_min_price, new_max_profit}
    end)
    |> elem(1)
  end
end

IO.puts StockProfit.max_profit([7, 1, 5, 3, 6, 4]) # Output: 5 (Buy at 1, sell at 6)

defmodule StockProfitTest do
  use ExUnit.Case

  test "returns the maximum profit for a given list of prices" do
    assert StockProfit.max_profit([7, 1, 5, 3, 6, 4]) == 5  # Buy at 1, sell at 6
  end

  test "returns 0 if no profit can be made" do
    assert StockProfit.max_profit([7, 6, 4, 3, 1]) == 0  # No profit, prices are decreasing
  end

  test "returns the correct profit with a single day of prices" do
    assert StockProfit.max_profit([5]) == 0  # No profit with only one price
  end

  test "returns the correct profit when there is only one price dip" do
    assert StockProfit.max_profit([10, 7, 5, 8, 11, 9]) == 6  # Buy at 5, sell at 11
  end
end
