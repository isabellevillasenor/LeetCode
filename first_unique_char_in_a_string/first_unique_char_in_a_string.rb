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
