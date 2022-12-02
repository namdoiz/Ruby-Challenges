=begin
Robot Name

Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you boot them up, 
a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, which means that their name gets wiped. 
The next time you ask, it will respond with a new random name.

The names must be random; they should not follow a predictable sequence. Random names means there is a risk of collisions. 
Your solution should not allow the use of the same name twice.

Things needed
  - Robot class
  - setter and getter methods for the name instance method
  - the robot name has exactly two letters in front and then three numbers
  - reset instance method
=end

class Robot
  attr_accessor :name

  def initialize
    Kernel.srand
    @name = []
    @name << ('A'..'Z').to_a.sample(2)
    @name << ('0'..'9').to_a.sample(3)
    @name = @name.join
  end

  def reset
    initialize
  end
end


