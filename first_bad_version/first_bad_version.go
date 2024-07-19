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
