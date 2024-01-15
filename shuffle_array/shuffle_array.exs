defmodule Solution do
  defstruct original: [], shuffled: []

  def new(nums), do: %Solution{original: nums, shuffled: nums}

  def reset(%Solution{original: original} = state), do: %{state | shuffled: original}

  def shuffle(%Solution{shuffled: shuffled} = state) do
    shuffled_list = Enum.shuffle(shuffled)
    %{state | shuffled: shuffled_list}
  end
end

defmodule SolutionTest do
  use ExUnit.Case
  alias Solution

  test "shuffles and resets an array" do
    nums = [1, 2, 3]
    solution = Solution.new(nums)

    shuffled = Solution.shuffle(solution)
    assert MapSet.new(shuffled.shuffled) == MapSet.new(nums)

    reset = Solution.reset(shuffled)
    assert reset.shuffled == nums
  end
end
