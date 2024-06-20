require 'rspec'
require 'pry'
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
class Test
  def two_sum(nums, target)
  # iterate over [nums] and add until == target
  # return nums placement in [] i.e. 0, 1
  binding.pry
    nums.each_with_index do |num, index|
        binding.pry
    end
  end
end

describe 'test' do
  it 'returns needed' do
    test = Test.new
    test.two_sum([2,7,11,15], 9)
  end
end
