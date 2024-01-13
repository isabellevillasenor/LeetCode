class Solution
  def initialize(nums)
    @original = nums.dup
    @shuffled = nums.dup
  end

  attr_accessor :original, :shuffled
end
