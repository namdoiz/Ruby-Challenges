=begin
Diamond

The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.

For C

  A
 B B
C   C
 B B
  A

For E

    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A

=end


class Diamond
  def self.make_diamond(letter)
    array = ("A"..letter.upcase).to_a
    width = array.size - 1
    middle = 0
    output = []
    array.each do |let|
      if let == "A"
        output << "#{" " * width}#{let}#{(" " * width)}\n"
        width -= 1
        middle += 1
      else
        output << "#{" " * width}#{let}#{" " * middle}#{let}#{(" " * width)}\n"
        width -= 1
        middle += 2
      end
    end

    #reversing...

    reversed = output.reverse
    reversed.delete_at(0)
    reversed.each do |lines|
      output << lines
    end
    final_string = ""
    output.each do |lines|
      final_string << lines
    end
    final_string
  end
end

