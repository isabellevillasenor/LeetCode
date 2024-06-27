require 'rspec'

class UniqueCharacter
  def first_uniq_char(s)
    freq = Hash.new(0)
    
    # Count the frequency of each character
    s.each_char { |char| freq[char] += 1 }

    # Find the first character with frequency 1
    s.each_char.with_index do |char, index|
      return index if freq[char] == 1
    end

    # Return -1 if no unique character is found
    -1
  end
end

RSpec.describe UniqueCharacter do
  describe '#first_uniq_char' do
    it 'returns the index of the first unique character' do
      unique_char = UniqueCharacter.new
      expect(unique_char.first_uniq_char("leetcode")).to eq(0)  # 'l' is unique at index 0
    end

    it 'returns -1 if there are no unique characters' do
      unique_char = UniqueCharacter.new
      expect(unique_char.first_uniq_char("aabbcc")).to eq(-1)  # No unique characters
    end

    it 'returns the correct index for a string with mixed characters' do
      unique_char = UniqueCharacter.new
      expect(unique_char.first_uniq_char("loveleetcode")).to eq(2)  # 'v' is unique at index 2
    end

    it 'returns 0 if the first character is unique' do
      unique_char = UniqueCharacter.new
      expect(unique_char.first_uniq_char("abcdef")).to eq(0)  # 'a' is unique at index 0
    end

    it 'returns -1 for an empty string' do
      unique_char = UniqueCharacter.new
      expect(unique_char.first_uniq_char("")).to eq(-1)  # No characters in the string
    end
  end
end
