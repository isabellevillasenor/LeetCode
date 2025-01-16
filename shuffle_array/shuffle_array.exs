defmodule Solution do
  defstruct original: [], shuffled: []

  def new(nums), do: %Solution{original: nums, shuffled: nums}

  def reset(%Solution{original: original} = state), do: %{state | shuffled: original}

  def shuffle(%Solution{shuffled: shuffled} = state) do
    shuffled_list = Enum.shuffle(shuffled)
    %{state | shuffled: shuffled_list}
  end
end
