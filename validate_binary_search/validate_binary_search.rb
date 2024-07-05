class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def is_valid_bst(root)
    valid_bst?(root, -Float::INFINITY, Float::INFINITY)
  end

  private

  def valid_bst?(node, min, max)
    return true if node.nil?

    # Ensure the current node's value is within the valid range
    return false if node.val <= min || node.val >= max

    # Recursively check the left and right subtrees
    valid_bst?(node.left, min, node.val) && valid_bst?(node.right, node.val, max)
  end
end
