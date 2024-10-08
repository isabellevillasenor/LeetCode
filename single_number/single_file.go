package main

func singleNumber(nums []int) int {
    result := 0
    for _, num := range nums {
        result ^= num // XOR approach
    }
    return result
}

package main

import "testing"

func TestSingleNumber(t *testing.T) {
    tests := []struct {
        input  []int
        output int
    }{
        {[]int{2, 2, 1}, 1},
        {[]int{4, 1, 2, 1, 2}, 4},
        {[]int{1}, 1},
    }

    for _, test := range tests {
        result := singleNumber(test.input)
        if result != test.output {
            t.Errorf("Expected %d but got %d", test.output, result)
        }
    }
}
