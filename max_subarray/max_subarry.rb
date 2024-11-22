class Solution
  def max_sub_array(nums)
    max_sum = nums[0]
    current_sum = nums[0]

    nums[1..].each do |num|
      current_sum = [num, current_sum + num].max
      max_sum = [max_sum, current_sum].max
    end

    max_sum
  end
end

require 'rspec'

RSpec.describe Solution do
  let(:solution) { Solution.new }

  it 'returns the maximum subarray sum' do
    expect(solution.max_sub_array([-2,1,-3,4,-1,2,1,-5,4])).to eq(6)
  end

  it 'returns the only element if array has one element' do
    expect(solution.max_sub_array([1])).to eq(1)
  end

  it 'handles all negative numbers' do
    expect(solution.max_sub_array([-1,-2,-3,-4])).to eq(-1)
  end
end
