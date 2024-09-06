defmodule Solution do
  @pairs %{")" => "(", "}" => "{", "]" => "["}

  def is_valid(s) do
    s
    |> String.graphemes()
    |> check_valid([])
  end

  defp check_valid([], []), do: true
  defp check_valid([], _), do: false

  defp check_valid([char | rest], stack) do
    cond do
      @pairs[char] && stack != [] && hd(stack) == @pairs[char] ->
        check_valid(rest, tl(stack))  # Pop from stack
      
      @pairs[char] ->
        false  # Invalid if stack is empty and closing bracket found

      true ->
        check_valid(rest, [char | stack])  # Push onto stack
    end
  end
end

defmodule SolutionTest do
  use ExUnit.Case
  doctest Solution

  test "valid cases" do
    assert Solution.is_valid("()") == true
    assert Solution.is_valid("()[]{}") == true
    assert Solution.is_valid("{[]}") == true
  end

  test "invalid cases" do
    assert Solution.is_valid("(]") == false
    assert Solution.is_valid("([)]") == false
    assert Solution.is_valid("{") == false
    assert Solution.is_valid("]") == false
  end
end
