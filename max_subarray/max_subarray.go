package main

func maxSubArray(nums []int) int {
    maxSum, currentSum := nums[0], nums[0]

    for i := 1; i < len(nums); i++ {
        currentSum = max(nums[i], currentSum+nums[i])
        maxSum = max(maxSum, currentSum)
    }

    return maxSum
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}

package main

import "testing"

func TestMaxSubArray(t *testing.T) {
    cases := []struct {
        input    []int
        expected int
    }{
        {[]int{-2,1,-3,4,-1,2,1,-5,4}, 6},
        {[]int{1}, 1},
        {[]int{-1, -2, -3, -4}, -1},
    }

    for _, c := range cases {
        result := maxSubArray(c.input)
        if result != c.expected {
            t.Errorf("For %v, expected %d but got %d", c.input, c.expected, result)
        }
    }
}
