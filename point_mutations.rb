=begin
  calculate the hamming distance between two DNA strands
  hamming distance is only defined for sequences of equal length
    - if you have two sequences of unequal length, you should compute the Hamming distance over the shorter length

  GAGCCTACTAACGGGAT
  CATCGTAATGACGGCCT
  ^ ^ ^  ^ ^    ^^

  algorithm
    - make a dna class that takes a string during initialization
    - instance method called hamming_distance that takes an argument
      - this argument is the new dna sequence that should be compared
    - before calculating the hamming distance,
      - make current string length the same as the the given string length
      - put the given strand and the new strand into an array
      - get the min by the size of each and get the size
      - make the given strand the same size as the smallest strand
      - make the new strand the same as the smallest strand
      - set counter to 0
      - go over the given strand with the index 
        - if the given strand at that index is the same as the new_strand at that index,
        - increase counter by one
      - return counter
    
=end

class DNA
  def initialize(given_strand)
    @given_strand = given_strand
  end

  def hamming_distance(new_strand)
    smallest_strand_size = [@given_strand, new_strand].min_by{|strand| strand.size}.size
    given_strand = @given_strand[0, smallest_strand_size]

    new_strand = new_strand[0, smallest_strand_size]

    counter = 0

    given_strand.chars.each_with_index do |let, index|
      counter += 1 if let != new_strand[index]
    end
    counter
  end
end
