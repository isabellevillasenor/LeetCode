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

