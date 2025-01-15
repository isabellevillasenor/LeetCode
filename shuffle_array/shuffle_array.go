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

package main

import (
    "reflect"
    "testing"
)

func TestSolution(t *testing.T) {
    nums := []int{1, 2, 3}
    obj := Constructor(nums)

    shuffled := obj.Shuffle()
    if !reflect.DeepEqual(shuffled, nums) && reflect.DeepEqual(obj.Reset(), nums) {
        t.Log("Shuffle and Reset work correctly")
    } else {
        t.Errorf("Shuffle or Reset did not work as expected")
    }
}
