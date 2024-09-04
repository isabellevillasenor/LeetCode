class Solution
  def is_valid(s)
    stack = []
    pairs = { ')' => '(', '}' => '{', ']' => '[' }

    s.each_char do |char|
      if pairs.key?(char)
        return false if stack.empty? || stack.pop != pairs[char]
      else
        stack.push(char)
      end
    end

    stack.empty?
  end
end

require 'rspec'

RSpec.describe Solution do
  let(:solution) { Solution.new }

  it 'validates correct parentheses' do
    expect(solution.is_valid("()")).to eq(true)
    expect(solution.is_valid("()[]{}")).to eq(true)
    expect(solution.is_valid("{[]}")).to eq(true)
  end

end

