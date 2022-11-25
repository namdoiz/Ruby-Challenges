=begin
  a program that, given a word, computes the screabble score for that word


    A, E, I, O, U, L, N, R, S, T	= 1
    D, G	1
    B, C, M, P	= 3
    F, H, V, W, Y	= 4
    K	= 5
    J, X	= 8
    Q, Z	= 10


  sum the valaues of all the tiles used in each word and return the value

  algorithm
    - create a Scrabble class that takes an argument at initialization
    - create a score instance method that would return the score of the word
    - case does not matter
    - create a score class method that takes a string and returns the score of the string
    - get the score
      - get the word
      - upcase the word
      - set count to 0
      - get the characters of the word
      - for each character in the word add count to the value based on the LETTER_SCORES hash
      - return count
    
=end

class Scrabble
  LETTER_SCORES = {"A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1,
                  "N" => 1, "R" => 1, "S" => 1, "T" => 1, "D" => 1, "G" => 1,
                  "B" => 3, "C" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4,
                  "V" => 4, "W" => 4, "Y" => 4, "K" => 5, "J" => 8, "X" => 8,
                  "Q" => 10, "Z" => 10}

  def initialize(word)
    @word = word
  end

  def self.score(word)
    count = 0
    return 0 if word.nil? || word.empty? || word.strip.empty?
    word.upcase.chars.each do |letter|
      count += LETTER_SCORES[letter]
    end
    count
  end

  def score
    count = 0
    return 0 if @word.nil? || @word.empty? || @word.strip.empty?
    @word.upcase.chars.each do |letter|
      count += LETTER_SCORES[letter]
    end
    count
  end
end

