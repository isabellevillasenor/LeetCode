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
