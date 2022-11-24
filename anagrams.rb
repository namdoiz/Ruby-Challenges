class Anagram
  def initialize(given_word)
    @given_word = given_word.downcase
  end
  
  def match(anagrams)
    original_anagrams = anagrams.map{|anagram| anagram.clone} # cloning the contents of the anagrams array so original_anagrams is an array that is not mutated on line 37. This is a deep cloning
    index_arr = []
    final_arr = []
    anagrams.map!{|anagram| anagram.downcase}
    @given_word.chars.each do |given_let|
      anagrams.each do |anagram_word|
        next if @given_word == anagram_word
        if anagram_word.include?(given_let)
          anagram_word.sub!(given_let, "*")
        end
      end
    end

    anagrams.each_with_index do |anagram, index|
      if anagram.length == @given_word.length && anagram.chars.all?{|letters| letters == "*"}
        index_arr << index
      end
    end

    return [] if index_arr.empty?

    index_arr.each do |idx|
      final_arr << original_anagrams[idx]
    end
    final_arr
  end
end
