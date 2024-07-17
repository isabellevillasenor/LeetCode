defmodule Solution do
  def is_valid_bst(root) do
    valid_bst?(root, -:infinity, :infinity)
  end

  defp valid_bst?(nil, _min, _max), do: true

  defp valid_bst?(%TreeNode{val: val, left: left, right: right}, min, max) do
    if val <= min or val >= max do
      false
    else
      valid_bst?(left, min, val) and valid_bst?(right, val, max)
    end
  end
end

defmodule TreeNode do
  defstruct [:val, :left, :right]

  def new(val, left \\ nil, right \\ nil) do
    %TreeNode{val: val, left: left, right: right}
  end
end

defmodule SolutionTest do
  use ExUnit.Case
  alias Solution
  alias TreeNode

  test "valid BST" do
    root = %TreeNode{val: 2, left: %TreeNode{val: 1}, right: %TreeNode{val: 3}}
    assert Solution.is_valid_bst(root) == true
  end
  
  test "invalid BST" do
    root = %TreeNode{
      val: 5,
      left: %TreeNode{val: 1},
      right: %TreeNode{
        val: 4,
        left: %TreeNode{val: 3},
        right: %TreeNode{val: 6}
      }
    }
    assert Solution.is_valid_bst(root) == false
  end

  test "empty tree" do
    root = nil
    assert Solution.is_valid_bst(root) == true
  end

  test "left child greater than parent" do
    root = %TreeNode{val: 2, left: %TreeNode{val: 3}, right: %TreeNode{val: 4}}
    assert Solution.is_valid_bst(root) == false
  end

  test "right child smaller than parent" do
    root = %TreeNode{val: 2, left: %TreeNode{val: 1}, right: %TreeNode{val: 0}}
    assert Solution.is_valid_bst(root) == false
  end

end
