class Solution
  def count_primes(n)
    return 0 if n < 2
    
    is_prime = Array.new(n, true)
    is_prime[0] = is_prime[1] = false

    (2...Math.sqrt(n)).each do |i|
      next unless is_prime[i]

      (i * i...n).step(i) { |j| is_prime[j] = false }
    end

    is_prime.count(true)
  end
end
