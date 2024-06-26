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
