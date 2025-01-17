class Solution
  def is_power_of_three(n)
    return false if n <= 0
    1162261467 % n == 0
  end
end

require 'rspec'

RSpec.describe Solution do
  it 'checks if a number is a power of three' do
    solution = Solution.new

    expect(solution.is_power_of_three(27)).to be true
    expect(solution.is_power_of_three(9)).to be true
    expect(solution.is_power_of_three(1)).to be true
    expect(solution.is_power_of_three(0)).to be false
    expect(solution.is_power_of_three(45)).to be false
  end
end
