defmodule Solution do
  def single_number(nums) do
    Enum.reduce(nums, 0, &Bitwise.bxor/2) # XOR approach
  end
end

defmodule SolutionTest do
  use ExUnit.Case
  doctest Solution

  test "finds the single number" do
    assert Solution.single_number([2, 2, 1]) == 1
    assert Solution.single_number([4, 1, 2, 1, 2]) == 4
    assert Solution.single_number([1]) == 1
  end
end
