defmodule Solution do
  def is_power_of_three(n) when n > 0, do: rem(1162261467, n) == 0
  def is_power_of_three(_), do: false
end
