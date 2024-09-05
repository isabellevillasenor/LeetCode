package solution

func IsValid(s string) bool {
    stack := []rune{}
    pairs := map[rune]rune{')': '(', '}': '{', ']': '['}

    for _, char := range s {
        if open, exists := pairs[char]; exists {
            if len(stack) == 0 || stack[len(stack)-1] != open {
                return false
            }
            stack = stack[:len(stack)-1] // Pop from stack
        } else {
            stack = append(stack, char) // Push to stack
        }
    }

    return len(stack) == 0
}

package solution

import "testing"

func TestIsValid(t *testing.T) {
    cases := []struct {
        input    string
        expected bool
    }{
        {"()", true},
        {"()[]{}", true},
        {"{[]}", true},
        {"(]", false},
        {"([)]", false},
        {"{", false},
        {"]", false},
    }

    for _, c := range cases {
        result := IsValid(c.input)
        if result != c.expected {
            t.Errorf("IsValid(%q) == %v, expected %v", c.input, result, c.expected)
        }
    }
}
