package main

func reverseString(s []byte) {
    left, right := 0, len(s)-1
    for left < right {
        s[left], s[right] = s[right], s[left] // Swap characters
        left++
        right--
    }
}

package main

import (
	"reflect"
	"testing"
)

func TestReverseString(t *testing.T) {
	tests := []struct {
		input  []byte
		output []byte
	}{
		{[]byte{'h', 'e', 'l', 'l', 'o'}, []byte{'o', 'l', 'l', 'e', 'h'}},
		{[]byte{'H', 'a', 'n', 'n', 'a', 'h'}, []byte{'h', 'a', 'n', 'n', 'a', 'H'}},
	}

	for _, test := range tests {
		reverseString(test.input)
		if !reflect.DeepEqual(test.input, test.output) {
			t.Errorf("Expected %v but got %v", test.output, test.input)
		}
	}
}
