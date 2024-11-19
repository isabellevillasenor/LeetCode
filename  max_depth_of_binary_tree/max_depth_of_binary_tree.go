package main

type TreeNode struct {
    Val   int
    Left  *TreeNode
    Right *TreeNode
}

func maxDepth(root *TreeNode) int {
    if root == nil {
        return 0
    }
    leftDepth := maxDepth(root.Left)
    rightDepth := maxDepth(root.Right)
    return 1 + max(leftDepth, rightDepth)
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}

package main

import "testing"

func TestMaxDepth(t *testing.T) {
    root := &TreeNode{Val: 3}
    root.Left = &TreeNode{Val: 9}
    root.Right = &TreeNode{Val: 20, Left: &TreeNode{Val: 15}, Right: &TreeNode{Val: 7}}

    if maxDepth(root) != 3 {
        t.Errorf("Expected 3, got %d", maxDepth(root))
    }

    if maxDepth(nil) != 0 {
        t.Errorf("Expected 0, got %d", maxDepth(nil))
    }

    singleNode := &TreeNode{Val: 1}
    if maxDepth(singleNode) != 1 {
        t.Errorf("Expected 1, got %d", maxDepth(singleNode))
    }
}
