defmodule Solution do
  def is_power_of_three(n) when n > 0, do: rem(1162261467, n) == 0
  def is_power_of_three(_), do: false
end

defmodule SolutionTest do
  use ExUnit.Case
  alias Solution

  test "checks if a number is a power of three" do
    assert Solution.is_power_of_three(27) == true
    assert Solution.is_power_of_three(9) == true
    assert Solution.is_power_of_three(1) == true
    assert Solution.is_power_of_three(0) == false
    assert Solution.is_power_of_three(45) == false
  end
end
