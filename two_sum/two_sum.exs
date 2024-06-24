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
