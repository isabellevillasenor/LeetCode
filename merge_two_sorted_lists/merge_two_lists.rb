require 'rspec'

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, next_node = nil)
    @val = val
    @next = next_node
  end
end

def merge_two_lists(l1, l2)
  dummy = ListNode.new
  current = dummy

  while l1 && l2
    if l1.val < l2.val
      current.next = l1
      l1 = l1.next
    else
      current.next = l2
      l2 = l2.next
    end
    current = current.next
  end

  current.next = l1 || l2
  dummy.next
end

RSpec.describe 'merge_two_lists' do
  it 'merges two sorted linked lists' do
    # Helper method to convert an array to a linked list
    def array_to_list(arr)
      head = ListNode.new(arr.shift)
      current = head
      arr.each do |val|
        current.next = ListNode.new(val)
        current = current.next
      end
      head
    end

    # Helper method to convert a linked list to an array
    def list_to_array(list)
      arr = []
      while list
        arr << list.val
        list = list.next
      end
      arr
    end

    l1 = array_to_list([1, 2, 4])
    l2 = array_to_list([1, 3, 4])

    merged = merge_two_lists(l1, l2)
    expect(list_to_array(merged)).to eq([1, 1, 2, 3, 4, 4])
  end

  it 'returns nil if both lists are empty' do
    l1 = nil
    l2 = nil
    merged = merge_two_lists(l1, l2)
    expect(merged).to be_nil
  end

  it 'returns the non-empty list if one list is empty' do
    l1 = nil
    l2 = array_to_list([1, 2, 3])
    merged = merge_two_lists(l1, l2)
    expect(list_to_array(merged)).to eq([1, 2, 3])
  end
end
