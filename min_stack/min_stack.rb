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
