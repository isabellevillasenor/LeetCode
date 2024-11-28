package main

func climbStairs(n int) int {
    if n <= 2 {
        return n
    }

    prev1, prev2 := 1, 2

    for i := 3; i <= n; i++ {
        prev1, prev2 = prev2, prev1+prev2
    }

    return prev2
}

package main

import "testing"

func TestClimbStairs(t *testing.T) {
    cases := []struct {
        input    int
        expected int
    }{
        {2, 2},
        {3, 3},
        {5, 8},
    }

    for _, c := range cases {
        result := climbStairs(c.input)
        if result != c.expected {
            t.Errorf("For %d, expected %d but got %d", c.input, c.expected, result)
        }
    }
}
