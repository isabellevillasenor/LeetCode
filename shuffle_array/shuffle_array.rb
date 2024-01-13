class Solution
  def initialize(nums)
    @original = nums.dup
    @shuffled = nums.dup
  end

  attr_accessor :original, :shuffled

  def reset
    shuffled = original.dup
  end

  def shuffle
    shuffled.shuffle!
  end
end

require 'rspec'

RSpec.describe Solution do
  it 'shuffles and resets an array' do
    nums = [1, 2, 3]
    solution = Solution.new(nums)

    expect(solution.shuffle).to match_array(nums)
    expect(solution.reset).to eq(nums)
    expect(solution.shuffle).to match_array(nums)
  end
end
