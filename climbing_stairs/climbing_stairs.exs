defmodule Solution do
  def climb_stairs(n) when n <= 2, do: n
  def climb_stairs(n), do: climb(n, 1, 2)

  defp climb(1, prev1, _prev2), do: prev1
  defp climb(2, _prev1, prev2), do: prev2
  defp climb(n, prev1, prev2), do: climb(n - 1, prev2, prev1 + prev2)
end

defmodule SolutionTest do
  use ExUnit.Case
  doctest Solution

  test "returns the number of ways to climb stairs" do
    assert Solution.climb_stairs(2) == 2
    assert Solution.climb_stairs(3) == 3
    assert Solution.climb_stairs(5) == 8
  end
end
