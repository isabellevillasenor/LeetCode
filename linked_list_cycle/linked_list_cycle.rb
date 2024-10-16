class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

class Solution
  def has_cycle(head)
    slow = head
    fast = head

    while fast && fast.next
      slow = slow.next
      fast = fast.next.next
      return true if slow == fast
    end

    false
  end
end

require 'rspec'

RSpec.describe Solution do
  it 'detects a cycle in a linked list' do
    solution = Solution.new

    # Creating a cycle: 3 -> 2 -> 0 -> -4 -> (back to 2)
    node1 = ListNode.new(3)
    node2 = ListNode.new(2)
    node3 = ListNode.new(0)
    node4 = ListNode.new(-4)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node2 # Cycle

    expect(solution.has_cycle(node1)).to be true

    # No cycle: 1 -> 2 -> nil
    node5 = ListNode.new(1)
    node6 = ListNode.new(2)
    node5.next = node6

    expect(solution.has_cycle(node5)).to be false

    # Single node with no cycle
    node7 = ListNode.new(1)
    expect(solution.has_cycle(node7)).to be false
  end
end
