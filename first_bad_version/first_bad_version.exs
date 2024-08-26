defmodule Solution do
  # Mocking the API is_bad_version/1
  def is_bad_version(version) do
    version >= 4 # Simulating that version 4 and above are bad
  end

  def first_bad_version(n), do: binary_search(1, n)

  defp binary_search(left, right) when left < right do
    mid = div(left + right, 2)

    if is_bad_version(mid) do
      binary_search(left, mid) # Move left if mid is bad
    else
      binary_search(mid + 1, right) # Move right otherwise
    end
  end

  defp binary_search(left, _right), do: left # Return first bad version
end
