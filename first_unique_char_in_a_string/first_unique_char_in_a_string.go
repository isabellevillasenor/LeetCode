package main

import "fmt"

func firstUniqChar(s string) int {
    freq := make(map[rune]int)

    // Count the frequency of each character
    for _, char := range s {
        freq[char]++
    }

    // Find the first unique character
    for i, char := range s {
        if freq[char] == 1 {
            return i
        }
    }

    // Return -1 if no unique character is found
    return -1
}

func main() {
    fmt.Println(firstUniqChar("leetcode")) // Output: 0 (Character 'l' is unique)
}

package main

import (
	"testing"
	"fmt"
)

func TestFirstUniqChar(t *testing.T) {
	tests := []struct {
		s    string
		want int
	}{
		{"leetcode", 0},  // 'l' is unique at index 0
		{"aabbcc", -1},    // No unique characters
		{"loveleetcode", 2}, // 'v' is unique at index 2
		{"abcdef", 0},     // 'a' is unique at index 0
		{"", -1},          // No characters in the string
	}

	for _, tt := range tests {
		t.Run(fmt.Sprintf("s=%s", tt.s), func(t *testing.T) {
			got := firstUniqChar(tt.s)
			if got != tt.want {
				t.Errorf("firstUniqChar(%v) = %v; want %v", tt.s, got, tt.want)
			}
		})
	}
}
