class Solution
  def climb_stairs(n)
    return n if n <= 2

    prev1, prev2 = 1, 2

    (3..n).each do
      prev1, prev2 = prev2, prev1 + prev2
    end

    prev2
  end
end

require 'rspec'

RSpec.describe Solution do
  let(:solution) { Solution.new }

  it 'returns the number of ways to climb stairs' do
    expect(solution.climb_stairs(2)).to eq(2)
    expect(solution.climb_stairs(3)).to eq(3)
    expect(solution.climb_stairs(5)).to eq(8)
  end
end
