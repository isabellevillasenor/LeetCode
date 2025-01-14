class Solution
  def initialize(nums)
    @original = nums.dup
    @shuffled = nums.dup
  end

  def reset
    @shuffled = @original.dup
  end

  def shuffle
    @shuffled.shuffle!
  end
end
