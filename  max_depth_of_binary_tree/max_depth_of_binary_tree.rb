class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Solution
  def max_depth(root)
    return 0 if root.nil?
    1 + [max_depth(root.left), max_depth(root.right)].max
  end
end

require 'rspec'

RSpec.describe Solution do
  let(:solution) { Solution.new }

  it 'calculates max depth correctly' do
    root = TreeNode.new(3)
    root.left = TreeNode.new(9)
    root.right = TreeNode.new(20, TreeNode.new(15), TreeNode.new(7))

    expect(solution.max_depth(root)).to eq(3)
  end

  it 'returns 0 for an empty tree' do
    expect(solution.max_depth(nil)).to eq(0)
  end

  # it 'returns 1 for a single node' do
  #   root = TreeNode.new(1)
  #   expect(solution.max_depth(root)).to eq(1)
  # end
end
