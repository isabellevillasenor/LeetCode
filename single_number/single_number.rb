class Solution
  def single_number(nums)
    nums.reduce(:^) # XOR approach
  end
end


RSpec.describe Solution do
  it 'finds the single number' do
    solution = Solution.new
    expect(solution.single_number([2,2,1])).to eq(1)
    expect(solution.single_number([4,1,2,1,2])).to eq(4)
    expect(solution.single_number([1])).to eq(1)
  end
end