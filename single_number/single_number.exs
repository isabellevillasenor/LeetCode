defmodule Solution do
  def single_number(nums) do
    Enum.reduce(nums, 0, &Bitwise.bxor/2) # XOR approach
  end
end
