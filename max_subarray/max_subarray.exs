defmodule Solution do
  def max_sub_array(nums) do
    {max_sum, _} = Enum.reduce(nums, {hd(nums), hd(nums)}, fn num, {max_sum, current_sum} ->
      new_sum = max(num, current_sum + num)
      {max(max_sum, new_sum), new_sum}
    end)

    max_sum
  end
end

defmodule SolutionTest do
  use ExUnit.Case
  doctest Solution

  test "returns the maximum subarray sum" do
    assert Solution.max_sub_array([-2,1,-3,4,-1,2,1,-5,4]) == 6
  end

  test "returns the only element if array has one element" do
    assert Solution.max_sub_array([1]) == 1
  end

  test "handles all negative numbers" do
    assert Solution.max_sub_array([-1,-2,-3,-4]) == -1
  end
end
