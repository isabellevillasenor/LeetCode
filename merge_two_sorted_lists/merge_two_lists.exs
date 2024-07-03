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


defmodule SolutionTest do
  use ExUnit.Case

  alias Solution.ListNode

  # Helper function to create a linked list from a list of integers
  defp create_list([]), do: nil
  defp create_list([head | tail]) do
    %ListNode{val: head, next: create_list(tail)}
  end

  # Helper function to convert a linked list to a list for comparison
  defp list_to_array(nil), do: []
  defp list_to_array(%ListNode{val: val, next: next}) do
    [val | list_to_array(next)]
  end

  test "merges two sorted lists" do
    l1 = create_list([1, 2, 4])
    l2 = create_list([1, 3, 4])

    merged = Solution.merge_two_lists(l1, l2)

    assert list_to_array(merged) == [1, 1, 2, 3, 4, 4]
  end

  test "returns nil if both lists are empty" do
    assert Solution.merge_two_lists(nil, nil) == nil
  end

  test "returns the non-empty list if one list is empty" do
    l1 = nil
    l2 = create_list([0, 5])

    merged = Solution.merge_two_lists(l1, l2)

    assert list_to_array(merged) == [0, 5]
  end

  test "merges when one list is empty" do
    l1 = create_list([1, 2, 3])
    l2 = nil

    merged = Solution.merge_two_lists(l1, l2)

    assert list_to_array(merged) == [1, 2, 3]
  end
end
