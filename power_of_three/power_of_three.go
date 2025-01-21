package main

import "testing"

func isPowerOfThree(n int) bool {
    return n > 0 && 1162261467%n == 0
}

package main

import "testing"

func TestIsPowerOfThree(t *testing.T) {
    cases := []struct {
        input    int
        expected bool
    }{
        {27, true},
        {9, true},
        {1, true},
        {0, false},
        {45, false},
    }

    for _, c := range cases {
        result := isPowerOfThree(c.input)
        if result != c.expected {
            t.Errorf("isPowerOfThree(%d) == %v, expected %v", c.input, result, c.expected)
        }
    }
}
