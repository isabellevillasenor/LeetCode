defmodule UniqueCharacter do
  def first_uniq_char(s) do
    freq = Enum.reduce(s, %{}, fn char, acc ->
      Map.update(acc, char, 1, &(&1 + 1))
    end)

    Enum.find_index(s, fn char -> Map.get(freq, char) == 1 end) || -1
  end
end

IO.puts UniqueCharacter.first_uniq_char("leetcode")  # Output: 0 (Character 'l' is unique)
