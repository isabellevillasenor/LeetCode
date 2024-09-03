defmodule Solution do
  def count_primes(n) when n < 2, do: 0

  def count_primes(n) do
    is_prime = :array.new(n, default: true)
    is_prime = :array.set(0, false, is_prime) |> :array.set(1, false)

    limit = :math.sqrt(n) |> trunc()

    is_prime =
      Enum.reduce(2..limit, is_prime, fn i, arr ->
        if :array.get(i, arr) do
          Enum.reduce(i * i..(n - 1)//i, arr, fn j, acc -> :array.set(j, false, acc) end)
        else
          arr
        end
      end)

    2..(n - 1)
    |> Enum.count(fn i -> :array.get(i, is_prime) end)
  end
end

defmodule SolutionTest do
  use ExUnit.Case
  alias Solution

  test "count primes correctly" do
    assert Solution.count_primes(10) == 4    # Primes: 2, 3, 5, 7
    assert Solution.count_primes(0) == 0
    assert Solution.count_primes(1) == 0
    assert Solution.count_primes(2) == 0
    assert Solution.count_primes(3) == 1     # Prime: 2
    assert Solution.count_primes(100) == 25
  end
end
