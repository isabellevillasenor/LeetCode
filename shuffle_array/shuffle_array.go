package main

import (
    "math/rand"
    "time"
)

type Solution struct {
    original []int
    shuffled []int
}

func Constructor(nums []int) Solution {
    return Solution{original: append([]int{}, nums...), shuffled: append([]int{}, nums...)}
}

func (this *Solution) Reset() []int {
    copy(this.shuffled, this.original)
    return this.shuffled
}

func (this *Solution) Shuffle() []int {
    rand.Seed(time.Now().UnixNano())
    for i := range this.shuffled {
        j := rand.Intn(i + 1)
        this.shuffled[i], this.shuffled[j] = this.shuffled[j], this.shuffled[i]
    }
    return this.shuffled
}
