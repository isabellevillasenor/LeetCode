class Solution
  def single_number(nums)
    nums.reduce(:^) # XOR approach
  end
end
