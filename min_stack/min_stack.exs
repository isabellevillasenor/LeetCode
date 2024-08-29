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
