defmodule MinStack do
  defstruct stack: [], min_stack: []

  def new(), do: %MinStack{}

  def push(%MinStack{stack: stack, min_stack: min_stack} = min_stack_struct, val) do
    new_min =
      case min_stack do
        [] -> val
        [min | _] -> min(val, min)
      end

    %MinStack{
      stack: [val | stack],
      min_stack: [new_min | min_stack]
    }
  end

  def pop(%MinStack{stack: [_ | rest_stack], min_stack: [_ | rest_min_stack]}) do
    %MinStack{stack: rest_stack, min_stack: rest_min_stack}
  end

  def top(%MinStack{stack: [top | _]}), do: top

  def get_min(%MinStack{min_stack: [min | _]}), do: min
end

defmodule MinStackTest do
  use ExUnit.Case
  alias MinStack

  test "MinStack operations" do
    stack = MinStack.new()
    stack = MinStack.push(stack, -2)
    stack = MinStack.push(stack, 0)
    stack = MinStack.push(stack, -3)

    assert MinStack.get_min(stack) == -3

    stack = MinStack.pop(stack)

    assert MinStack.top(stack) == 0
    assert MinStack.get_min(stack) == -2
  end
end
