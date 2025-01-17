class Solution
  def is_power_of_three(n)
    return false if n <= 0
    1162261467 % n == 0
  end
end
