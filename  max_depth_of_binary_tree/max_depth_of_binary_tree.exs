defmodule Solution do
  def max_depth(nil), do: 0
  def max_depth(%{left: left, right: right}) do
    1 + max(max_depth(left), max_depth(right))
  end
end

defmodule SolutionTest do
  use ExUnit.Case

  defmodule TreeNode do
    defstruct val: 0, left: nil, right: nil
  end

  test "calculates max depth correctly" do
    root = %TreeNode{val: 3, left: %TreeNode{val: 9}, right: %TreeNode{val: 20, left: %TreeNode{val: 15}, right: %TreeNode{val: 7)}}

    assert Solution.max_depth(root) == 3
  end

  test "returns 0 for an empty tree" do
    assert Solution.max_depth(nil) == 0
  end

  test "returns 1 for a single node" do
    root = %TreeNode{val: 1}
    assert Solution.max_depth(root) == 1
  end
end
