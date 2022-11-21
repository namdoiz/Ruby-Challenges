class Triangle
  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
    validate_sides
  end

  def kind
    sides = [@s1, @s2, @s3]
    return 'equilateral' if sides.all?{|side| side == sides[0]}
    return 'isosceles' if [[@s1, @s2], [@s1, @s3], [@s2, @s3]].any?{|sides| sides[0] == sides[1]}
    'scalene'
  end

  private

  def validate_sides
    raise (ArgumentError) if [@s1, @s2, @s3].any?{|side| side <= 0}
    raise (ArgumentError) if [[[@s1, @s2], @s3], [[@s1, @s3], @s2], [[@s2, @s3], @s1]].any?{|sides| sides[0].sum <= sides[1]}
  end
end
