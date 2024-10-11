class Solution
  def reverse_string(s)
    s.reverse!
  end
end

require 'rspec'

RSpec.describe Solution do
  it 'reverses the string' do
    solution = Solution.new
    arr1 = ['h', 'e', 'l', 'l', 'o']
    arr2 = ['H', 'a', 'n', 'n', 'a', 'h']

    solution.reverse_string(arr1)
    solution.reverse_string(arr2)

    expect(arr1).to eq(['o', 'l', 'l', 'e', 'h'])
    expect(arr2).to eq(['h', 'a', 'n', 'n', 'a', 'H'])
  end
end