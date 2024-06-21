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


describe 'Test#two_sum' do
  it 'returns the correct indices for a valid case' do
    test = Test.new
    expect(test.two_sum([2, 7, 11, 15], 9)).to eq([0, 1])
  end

  it 'returns the correct indices when numbers repeat' do
    test = Test.new
    expect(test.two_sum([3, 2, 4], 6)).to eq([1, 2])
  end

  it 'returns the correct indices for negative numbers' do
    test = Test.new
    expect(test.two_sum([-3, 4, 3, 90], 0)).to eq([0, 2])
  end

  it 'returns the correct indices when target is zero' do
    test = Test.new
    expect(test.two_sum([0, 4, 3, 0], 0)).to eq([0, 3])
  end
end
