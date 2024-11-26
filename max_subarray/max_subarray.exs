defmodule Solution do
  def max_sub_array(nums) do
    {max_sum, _} = Enum.reduce(nums, {hd(nums), hd(nums)}, fn num, {max_sum, current_sum} ->
      new_sum = max(num, current_sum + num)
      {max(max_sum, new_sum), new_sum}
    end)

    max_sum
  end
end
