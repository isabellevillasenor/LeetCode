package main

import "math"

type TreeNode struct {
    Val   int
    Left  *TreeNode
    Right *TreeNode
}

func isValidBST(root *TreeNode) bool {
    return validateBST(root, math.MinInt64, math.MaxInt64)
}

func validateBST(node *TreeNode, min, max int) bool {
	if node == nil {
			return true
	}

	if node.Val <= min || node.Val >= max {
			return false
	}

	return validateBST(node.Left, min, node.Val) && validateBST(node.Right, node.Val, max)
}

package main

import (
    "testing"
)

func TestIsValidBST(t *testing.T) {
    tests := []struct {
        name  string
        root  *TreeNode
        valid bool
    }{
        {
            name: "Valid BST",
            root: &TreeNode{
                Val: 2,
                Left: &TreeNode{
                    Val: 1,
                },
                Right: &TreeNode{
                    Val: 3,
                },
            },
            valid: true,
        },
        {
            name: "Invalid BST",
            root: &TreeNode{
                Val: 5,
                Left: &TreeNode{
                    Val: 1,
                },
                Right: &TreeNode{
                    Val: 4,
                    Left: &TreeNode{
                        Val: 3,
                    },
                    Right: &TreeNode{
                        Val: 6,
                    },
                },
            },
            valid: false,
        },
        {
            name: "Empty tree",
            root: nil,
            valid: true,
        },
        {
            name: "Left child greater than parent",
            root: &TreeNode{
                Val: 2,
                Left: &TreeNode{
                    Val: 3,
                },
                Right: &TreeNode{
                    Val: 4,
                },
            },
            valid: false,
        },
        {
            name: "Right child smaller than parent",
            root: &TreeNode{
                Val: 2,
                Left: &TreeNode{
                    Val: 1,
                },
                Right: &TreeNode{
                    Val: 0,
                },
            },
            valid: false,
        },
    }

    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            result := isValidBST(tt.root)
            if result != tt.valid {
                t.Errorf("expected %v, got %v", tt.valid, result)
            }
        })
    }
}
