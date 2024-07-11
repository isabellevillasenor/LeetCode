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
