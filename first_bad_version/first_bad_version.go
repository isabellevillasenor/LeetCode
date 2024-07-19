package main

// Mocking the API isBadVersion
func isBadVersion(version int) bool {
    return version >= 4 // Simulating that version 4 and above are bad
}

func firstBadVersion(n int) int {
    left, right := 1, n

    for left < right {
        mid := left + (right-left)/2

        if isBadVersion(mid) {
            right = mid // The bad version is on the left side or is mid itself
        } else {
            left = mid + 1 // The bad version is on the right side
        }
    }

    return left
}

package main

import (
	"testing"
)

func TestFirstBadVersion(t *testing.T) {
	// Define a helper function to mock different cases
	tests := []struct {
		n        int
		expected int
	}{
		{5, 4},
		{10, 4},
		{7, 4},
		{3, 3},  // Simulating first bad version is 3
		{1000, 4}, // Large input test case
	}

	for _, test := range tests {
		result := firstBadVersion(test.n)
		if result != test.expected {
			t.Errorf("firstBadVersion(%d) = %d; expected %d", test.n, result, test.expected)
		}
	}
}
