require 'rspec'
require 'pry'

class Test
  def two_sum(nums, target)
    seen = {}
    
    nums.each_with_index do |num, i|
      complement = target - num
      return [seen[complement], i] if seen.key?(complement)
  
      seen[num] = i
    end
  end
  
end

describe 'test' do
  it 'returns needed' do
    test = Test.new
    test.two_sum([2,7,11,15], 9)
  end
end
