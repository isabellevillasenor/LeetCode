package main

import "fmt"

func maxProfit(prices []int) int {
    minPrice := int(^uint(0) >> 1) // Equivalent to math.MaxInt
    maxProfit := 0

    for _, price := range prices {
        if price < minPrice {
            minPrice = price
        } else if price - minPrice > maxProfit {
            maxProfit = price - minPrice
        }
    }

    return maxProfit
}

func main() {
    fmt.Println(maxProfit([]int{7, 1, 5, 3, 6, 4})) // Output: 5 (Buy at 1, sell at 6)
}

package main

import (
	"testing"
	"reflect"
)

func TestMaxProfit(t *testing.T) {
	tests := []struct {
		prices []int
		want   int
	}{
		{[]int{7, 1, 5, 3, 6, 4}, 5},  // Buy at 1, sell at 6
		{[]int{7, 6, 4, 3, 1}, 0},     // No profit, prices are decreasing
		{[]int{5}, 0},                 // No profit with only one price
		{[]int{10, 7, 5, 8, 11, 9}, 6}, // Buy at 5, sell at 11
	}

	for _, tt := range tests {
		t.Run(fmt.Sprintf("prices=%v", tt.prices), func(t *testing.T) {
			got := maxProfit(tt.prices)
			if !reflect.DeepEqual(got, tt.want) {
				t.Errorf("maxProfit(%v) = %v; want %v", tt.prices, got, tt.want)
			}
		})
	}
}
