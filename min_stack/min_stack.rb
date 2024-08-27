class MinStack
  def initialize
    @stack = []
    @min_stack = []
  end

  def push(val)
    @stack.push(val)
    @min_stack.push([val, @min_stack.empty? ? val : [val, @min_stack.last[1]].min])
  end

  def pop
    @stack.pop
    @min_stack.pop
  end

  def top
    @stack.last
  end

  def get_min
    @min_stack.last[1]
  end
end

require 'rspec'

RSpec.describe MinStack do
  it 'performs push, pop, top, and get_min correctly' do
    stack = MinStack.new
    stack.push(-2)
    stack.push(0)
    stack.push(-3)
    expect(stack.get_min).to eq(-3)  # Minimum is -3
    stack.pop
    expect(stack.top).to eq(0)       # Top is now 0
    expect(stack.get_min).to eq(-2)  # Minimum is now -2
  end
end
