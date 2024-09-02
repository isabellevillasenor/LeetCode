package main

import "math"

func countPrimes(n int) int {
    if n < 2 {
        return 0
    }

    isPrime := make([]bool, n)
    for i := range isPrime {
        isPrime[i] = true
    }
    isPrime[0], isPrime[1] = false, false

    for i := 2; i < int(math.Sqrt(float64(n)))+1; i++ {
        if isPrime[i] {
            for j := i * i; j < n; j += i {
                isPrime[j] = false
            }
        }
    }

    count := 0
    for _, prime := range isPrime {
        if prime {
            count++
        }
    }

    return count
}

package main

import "testing"

func TestCountPrimes(t *testing.T) {
    tests := []struct {
        n        int
        expected int
    }{
        {10, 4},   // Primes: 2, 3, 5, 7
        {0, 0},
        {1, 0},
        {2, 0},
        {3, 1},    // Prime: 2
        {100, 25}, // Primes up to 100
    }

    for _, test := range tests {
        result := countPrimes(test.n)
        if result != test.expected {
            t.Errorf("For n=%d, expected %d but got %d", test.n, test.expected, result)
        }
    }
}
