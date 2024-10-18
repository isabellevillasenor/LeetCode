defmodule Solution do
  def has_cycle?(head) do
    detect_cycle(head, head)
  end

  defp detect_cycle(nil, _), do: false
  defp detect_cycle(_, nil), do: false
  defp detect_cycle(slow, fast) when slow == fast, do: true
  defp detect_cycle(slow, fast) do
    if fast.next && fast.next.next do
      detect_cycle(slow.next, fast.next.next)
    else
      false
    end
  end
end

defmodule SolutionTest do
  use ExUnit.Case

  defmodule ListNode do
    defstruct val: 0, next: nil
  end

  test "detects cycle in a linked list" do
    # Creating a cycle: 3 -> 2 -> 0 -> -4 -> (back to 2)
    node1 = %ListNode{val: 3}
    node2 = %ListNode{val: 2}
    node3 = %ListNode{val: 0}
    node4 = %ListNode{val: -4}
    node1 = %{node1 | next: node2}
    node2 = %{node2 | next: node3}
    node3 = %{node3 | next: node4}
    node4 = %{node4 | next: node2} # Cycle

    assert Solution.has_cycle?(node1) == true

    # No cycle: 1 -> 2 -> nil
    node5 = %ListNode{val: 1, next: %ListNode{val: 2}}
    assert Solution.has_cycle?(node5) == false

    # Single node with no cycle
    node6 = %ListNode{val: 1}
    assert Solution.has_cycle?(node6) == false
  end
end
