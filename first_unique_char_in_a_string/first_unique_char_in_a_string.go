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
