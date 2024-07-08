require 'rspec'

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

    return false if node.val <= min || node.val >= max

    valid_bst?(node.left, min, node.val) && valid_bst?(node.right, node.val, max)
  end
end

RSpec.describe Solution do
  let(:solution) { Solution.new }

  describe '#is_valid_bst' do
    it 'returns true for a valid BST' do
      # Creating a valid BST: 
      #       2
      #      / \
      #     1   3
      root = TreeNode.new(2)
      root.left = TreeNode.new(1)
      root.right = TreeNode.new(3)

      expect(solution.is_valid_bst(root)).to be true
    end

    it 'returns false for an invalid BST' do
      # Creating an invalid BST:
      #       5
      #      / \
      #     1   4
      #        / \
      #       3   6
      root = TreeNode.new(5)
      root.left = TreeNode.new(1)
      root.right = TreeNode.new(4)
      root.right.left = TreeNode.new(3)
      root.right.right = TreeNode.new(6)

      expect(solution.is_valid_bst(root)).to be false
    end

    it 'returns true for an empty tree' do
      root = nil
      expect(solution.is_valid_bst(root)).to be true
    end
    it 'returns false when left child is greater than parent' do
      # Creating an invalid BST:
      #       2
      #      / \
      #     3   4
      root = TreeNode.new(2)
      root.left = TreeNode.new(3)
      root.right = TreeNode.new(4)

      expect(solution.is_valid_bst(root)).to be false
    end


  end
end
