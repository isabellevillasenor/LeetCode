defmodule TwoSum do
  def two_sum(nums, target) do
    nums
    |> Enum.with_index()
    |> Enum.reduce_while(%{}, fn {num, index}, seen ->
      complement = target - num

      case Map.fetch(seen, complement) do
        {:ok, comp_index} -> {:halt, [comp_index, index]}
        :error -> {:cont, Map.put(seen, num, index)}
      end
    end)
  end
end

# Example usage
IO.inspect(TwoSum.two_sum([2, 7, 11, 15], 9)) # Output: [0, 1]

defmodule TwoSumTest do
  use ExUnit.Case
  doctest TwoSum

  test "finds correct indices for basic case" do
    assert TwoSum.two_sum([2, 7, 11, 15], 9) == [0, 1]
  end

  test "finds correct indices when numbers repeat" do
    assert TwoSum.two_sum([3, 2, 4], 6) == [1, 2]
  end

  test "handles negative numbers" do
    assert TwoSum.two_sum([-3, 4, 3, 90], 0) == [0, 2]
  end

  test "handles zero sum case" do
    assert TwoSum.two_sum([0, 4, 3, 0], 0) == [0, 3]
  end
end
