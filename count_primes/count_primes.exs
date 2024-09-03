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
