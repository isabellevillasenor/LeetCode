defmodule Solution do
  defmodule ListNode do
    defstruct [:val, :next]
  end

  def merge_two_lists(nil, nil), do: nil
  def merge_two_lists(l1, nil), do: l1
  def merge_two_lists(nil, l2), do: l2

  def merge_two_lists(%ListNode{val: v1, next: n1}, %ListNode{val: v2, next: n2}) do
    cond do
      v1 < v2 ->
        %ListNode{val: v1, next: merge_two_lists(n1, %ListNode{val: v2, next: n2})}
      
      v1 >= v2 ->
        %ListNode{val: v2, next: merge_two_lists(%ListNode{val: v1, next: n1}, n2)}
    end
  end
end
