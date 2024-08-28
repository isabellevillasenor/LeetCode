package main

type MinStack struct {
	stack    []int
	minStack []int
}

func Constructor() MinStack {
	return MinStack{}
}

func (this *MinStack) Push(val int) {
	this.stack = append(this.stack, val)
	if len(this.minStack) == 0 || val <= this.GetMin() {
		this.minStack = append(this.minStack, val)
	}
}

func (this *MinStack) Pop() {
	if len(this.stack) == 0 {
		return
	}
	if this.stack[len(this.stack)-1] == this.GetMin() {
		this.minStack = this.minStack[:len(this.minStack)-1]
	}
	this.stack = this.stack[:len(this.stack)-1]
}

func (this *MinStack) Top() int {
	return this.stack[len(this.stack)-1]
}

func (this *MinStack) GetMin() int {
	return this.minStack[len(this.minStack)-1]
}

package main

import (
	"testing"
)

func TestMinStack(t *testing.T) {
	stack := Constructor()
	stack.Push(-2)
	stack.Push(0)
	stack.Push(-3)

	if stack.GetMin() != -3 {
		t.Errorf("Expected -3, got %d", stack.GetMin())
	}

	stack.Pop()

	if stack.Top() != 0 {
		t.Errorf("Expected 0, got %d", stack.Top())
	}

	if stack.GetMin() != -2 {
		t.Errorf("Expected -2, got %d", stack.GetMin())
	}
}

