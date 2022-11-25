=begin
The Greek mathematician Nicomachus devised a classification scheme for natural numbers (1, 2, 3, ...), identifying each as belonging uniquely 
to the categories of abundant, perfect, or deficient based on a comparison between the number and the sum of its positive divisors (the numbers 
that can be evenly divided into the target number with no remainder, excluding the number itself). For instance, the positive divisors of 15 
are 1, 3, and 5. This sum is known as the Aliquot sum.

Perfect numbers have an Aliquot sum that is equal to the original number.
Abundant numbers have an Aliquot sum that is greater than the original number.
Deficient numbers have an Aliquot sum that is less than the original number.
Examples:

6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.


Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.


Write a program that can tell whether a number is perfect, abundant, or deficient.

algorithm

 - create a PerfectNumber class
 - create a classify class method that takes an integer argument and returns whether the integer is 
   perfect, deficient or aboundant
 - raise a standarderror exception when youre asked to classify a negative number
 - get the given number
 - selected numbers = []
 - for each number from 0...the given number .each
   - if the given number modulo the iterated number is 0 then add the number to the array
   - sum the selected numbers array
   - if the selected numbes array is the same as the given number then return "perfect"
   - if the selected number is less than the given number then return "deficient"
   - if the selected number is greater than the given number then return "aboundant"

=end

class PerfectNumber
  def self.classify(given_num)
    raise StandardError if given_num < 0

    selected_numbers = []

    (1...given_num).each do |num|
      if given_num % num == 0
        selected_numbers << num
      end
    end

    if selected_numbers.sum == given_num
      "perfect"
    elsif selected_numbers.sum > given_num
      "abundant"
    else
      "deficient"
    end
  end
end
