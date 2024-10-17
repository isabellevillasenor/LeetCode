package main

type ListNode struct {
    Val  int
    Next *ListNode
}

func hasCycle(head *ListNode) bool {
    slow, fast := head, head

    for fast != nil && fast.Next != nil {
        slow = slow.Next
        fast = fast.Next.Next
        if slow == fast {
            return true
        }
    }

    return false
}

package main

import "testing"

func TestHasCycle(t *testing.T) {
    // Creating a cycle: 3 -> 2 -> 0 -> -4 -> (back to 2)
    node1 := &ListNode{Val: 3}
    node2 := &ListNode{Val: 2}
    node3 := &ListNode{Val: 0}
    node4 := &ListNode{Val: -4}

    node1.Next = node2
    node2.Next = node3
    node3.Next = node4
    node4.Next = node2 // Cycle

    if !hasCycle(node1) {
        t.Errorf("Expected true, got false")
    }

    // No cycle: 1 -> 2 -> nil
    node5 := &ListNode{Val: 1}
    node6 := &ListNode{Val: 2}
    node5.Next = node6

    if hasCycle(node5) {
        t.Errorf("Expected false, got true")
    }

    // Single node with no cycle
    node7 := &ListNode{Val: 1}

    if hasCycle(node7) {
        t.Errorf("Expected false, got true")
    }
}
