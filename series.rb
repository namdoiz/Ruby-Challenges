=begin
Series

Write a program that will take a string of digits and return all the possible consecutive number series of a specified length in that string.

For example, the string "01234" has the following 3-digit series:

012
123
234
Likewise, here are the 4-digit series:

0123
1234
Finally, if you ask for a 6-digit series from a 5-digit string, you should throw an error.
=end

class Series
  def initialize(str_num)
    @str_num = str_num.chars.map(&:to_i)
  end

  def slices(required_num)
    raise ArgumentError if required_num > @str_num.length
    if required_num == 1
      final_arr = []
      @str_num.each do |num|
        final_arr << [num]
      end
      final_arr
    else
      final_arr = []
      @str_num.each_with_index do |num, idx|
        sub_arr = []
        sub_arr << num
        counter = idx + 1
        loop do
          sub_arr << @str_num[counter]
          counter += 1
          break if sub_arr.size == required_num
        end
        final_arr << sub_arr
      end
      final_arr.reject{|arr| arr.include?(nil)}
    end
  end
end
