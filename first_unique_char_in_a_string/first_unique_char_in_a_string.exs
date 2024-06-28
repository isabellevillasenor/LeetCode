defmodule UniqueCharacter do
  def first_uniq_char(s) do
    freq = Enum.reduce(s, %{}, fn char, acc ->
      Map.update(acc, char, 1, &(&1 + 1))
    end)

    Enum.find_index(s, fn char -> Map.get(freq, char) == 1 end) || -1
  end
end

IO.puts UniqueCharacter.first_uniq_char("leetcode")  # Output: 0 (Character 'l' is unique)

defmodule UniqueCharacterTest do
  use ExUnit.Case

  test "returns the index of the first unique character" do
    assert UniqueCharacter.first_uniq_char("leetcode") == 0  # 'l' is unique at index 0
  end

  test "returns -1 if there are no unique characters" do
    assert UniqueCharacter.first_uniq_char("aabbcc") == -1  # No unique characters
  end

  test "returns the correct index for a string with mixed characters" do
    assert UniqueCharacter.first_uniq_char("loveleetcode") == 2  # 'v' is unique at index 2
  end

  test "returns 0 if the first character is unique" do
    assert UniqueCharacter.first_uniq_char("abcdef") == 0  # 'a' is unique at index 0
  end

  test "returns -1 for an empty string" do
    assert UniqueCharacter.first_uniq_char("") == -1  # No characters in the string
  end
end
