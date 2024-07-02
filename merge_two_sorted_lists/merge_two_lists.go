package main

import "fmt"

// Definition for singly-linked list.
type ListNode struct {
    Val  int
    Next *ListNode
}

func mergeTwoLists(l1 *ListNode, l2 *ListNode) *ListNode {
    dummy := &ListNode{}
    current := dummy

    // Merge the two lists while both are non-empty
    for l1 != nil && l2 != nil {
        if l1.Val < l2.Val {
            current.Next = l1
            l1 = l1.Next
        } else {
            current.Next = l2
            l2 = l2.Next
        }
        current = current.Next
    }

    // If either list has remaining elements, append them
    if l1 != nil {
        current.Next = l1
    } else {
        current.Next = l2
    }

    return dummy.Next
}

// Helper function to print the list for testing
func printList(head *ListNode) {
    for head != nil {
        fmt.Print(head.Val, " ")
        head = head.Next
    }
    fmt.Println()
}


package main

import (
    "testing"
)

func TestMergeTwoLists(t *testing.T) {
    // Helper function to create a linked list from a slice of integers
    createList := func(nums []int) *ListNode {
        dummy := &ListNode{}
        current := dummy
        for _, num := range nums {
            current.Next = &ListNode{Val: num}
            current = current.Next
        }
        return dummy.Next
    }

    // Test cases
    tests := []struct {
        l1, l2, expected []int
    }{
        {[]int{1, 2, 4}, []int{1, 3, 4}, []int{1, 1, 2, 3, 4, 4}},
        {[]int{}, []int{}, []int{}},
        {[]int{1, 2, 3}, []int{}, []int{1, 2, 3}},
        {[]int{}, []int{0, 5}, []int{0, 5}},
    }

    for _, test := range tests {
        l1 := createList(test.l1)
        l2 := createList(test.l2)
        expected := createList(test.expected)

        result := mergeTwoLists(l1, l2)

        // Compare result with expected
        for result != nil || expected != nil {
            if result == nil || expected == nil || result.Val != expected.Val {
                t.Errorf("Test failed! Expected: %v, Got: %v", test.expected, result)
                break
            }
            result = result.Next
            expected = expected.Next
        }
    }
}
