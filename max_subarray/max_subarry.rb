class Solution
  def max_sub_array(nums)
    max_sum = nums[0]
    current_sum = nums[0]

    nums[1..].each do |num|
      current_sum = [num, current_sum + num].max
      max_sum = [max_sum, current_sum].max
    end

    max_sum
  end
end
