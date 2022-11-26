=begin
Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output. Treat invalid input as octal 0.

Note: Implement the conversion yourself. Don't use any built-in or library methods that perform the necessary conversions for you. In this exercise, the code necessary to perform the conversion is what we're looking for.

algorithm
  - create an Octal class that takes a string at initialization
  - if the given string includes any letter then return 0
  - create a to_decimal instance method that returns the octal of the string given
  - how to solve
    - get the string
    - return 0 if the string contains letters
    - final_num = 0
    - base = 1
    - get the digits of the given number
    - for each digit in the given number
      - multiply the digit by the base and add it to final_num
      - reassign the base to the base multiplied by 10
    

=end

class Octal
  def initialize(given_num)
    @given_num = given_num
  end

  def to_decimal
    return 0 if @given_num.chars.any?{|str| /[a-zA-Z89]/ === str}
    given_num_digits = @given_num.to_i.digits
    final_num = 0
    base = 1
    given_num_digits.each do |digit|
      final_num += digit*base
      base *= 8
    end
    final_num
  end
end
