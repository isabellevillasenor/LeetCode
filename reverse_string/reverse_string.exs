defmodule Solution do
  def reverse_string(s), do: Enum.reverse(s)
end

defmodule SolutionTest do
  use ExUnit.Case
  doctest Solution

  test "reverses the string" do
    assert Solution.reverse_string(['h', 'e', 'l', 'l', 'o']) == ['o', 'l', 'l', 'e', 'h']
    assert Solution.reverse_string(['H', 'a', 'n', 'n', 'a', 'h']) == ['h', 'a', 'n', 'n', 'a', 'H']
  end
end
