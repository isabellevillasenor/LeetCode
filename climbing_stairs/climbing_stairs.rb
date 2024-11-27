class Solution
  def climb_stairs(n)
    return n if n <= 2

    prev1, prev2 = 1, 2

    (3..n).each do
      prev1, prev2 = prev2, prev1 + prev2
    end

    prev2
  end
end
