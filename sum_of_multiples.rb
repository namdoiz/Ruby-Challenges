=begin
Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all the multiples of the numbers 
in the set that are less than the first number. If the set of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. 
The sum of these multiples is 78.

=end

class SumOfMultiples
  def initialize(*given_set)
    @given_set = given_set
  end

  def to(given_num)
    final_arr = []

    @given_set.each do |set_num|
      count = 1
      while (set_num * count) < given_num
        final_arr << (set_num * count)
        count += 1
      end
    end

    final_arr.uniq.sum
  end

  def self.to(given_num)
    SumOfMultiples.new(3, 5).to(given_num)
  end
end
