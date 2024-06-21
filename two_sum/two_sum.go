package main

import "fmt"

func twoSum(nums []int, target int) []int {
    seen := make(map[int]int)

    for i, num := range nums {
        complement := target - num
        if index, found := seen[complement]; found {
            return []int{index, i}
        }
        seen[num] = i
    }
    return nil
}

func main() {
    fmt.Println(twoSum([]int{2, 7, 11, 15}, 9)) // Output: [0, 1]
}

package main

import (
	"reflect"
	"testing"
)

func TestTwoSum(t *testing.T) {
	tests := []struct {
		nums   []int
		target int
		want   []int
	}{
		{[]int{2, 7, 11, 15}, 9, []int{0, 1}},
		{[]int{3, 2, 4}, 6, []int{1, 2}},
		{[]int{-3, 4, 3, 90}, 0, []int{0, 2}},
		{[]int{0, 4, 3, 0}, 0, []int{0, 3}},
	}

	for _, tt := range tests {
		got := twoSum(tt.nums, tt.target)
		if !reflect.DeepEqual(got, tt.want) {
			t.Errorf("twoSum(%v, %d) = %v; want %v", tt.nums, tt.target, got, tt.want)
		}
	}
}
