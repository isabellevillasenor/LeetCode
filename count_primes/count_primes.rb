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

require 'rspec'

RSpec.describe Solution do
  let(:solution) { Solution.new }

  it 'counts primes correctly' do
    expect(solution.count_primes(10)).to eq(4)  # Primes: 2, 3, 5, 7
    expect(solution.count_primes(0)).to eq(0)
    expect(solution.count_primes(1)).to eq(0)
    expect(solution.count_primes(2)).to eq(0)
    expect(solution.count_primes(3)).to eq(1)   # Prime: 2
    expect(solution.count_primes(100)).to eq(25)
  end
end
