=begin
Clock

Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time represented by a given Clock object. 
Note that you should not mutate Clock objects when adding and subtracting minutes -- create a new Clock object.

Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations

Things needed
  - at instance method can take one or two integer arguments
    - first argument is the hour and the second argument is the minutes
  - a to_s method that returns a string of the time in 24 hours clock
  - + method that takes an integer argument which is meant to be minutes
  - - instance method that takes an integer argument which is meant to be minutes
  - do not mutate clock objects when adding and subtracting minutes, create a new clock object
  - 
  to return a string as an output
    - get the hour first and then the minutes
    - if the hour is just one number then put the 0 in front of it
    - if you get a 
  
  to add minutes
    - create a new clock class
    loop
    - check if the minutes given is greater than 60
      - if it is then remove 60 from it and add one to the hour side of the clock
      - if it is not then keep the minutes as that and break

  to subtract minutes
    - get the given minutes divmod 60
    - get the prevoius clock's hour
    - get the prevous clock's minutes
    - subtract the previous hour by the new clock's hour
    - subtract the previous minutes by the new clock's minutes
    - create a new clock with the final hour and the final minutes as the arguments

  to format the times
    - if the hour is less than 0 then add 24 to it
    - if the hour is greater than or equal to 24 then subtract 24 from it
    - if the minutes is greater than or equal to 60 then subtract 60 from it and add one to the hour
      then format the hour again
    - if the minutes is less than 0
      - subtract 1 from the hour
      - call the format hour method
      - add 60 to the minutes
      - call the format minutes method.
=end


class Clock
  attr_accessor :hour, :minutes

  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end

  def self.at(hour, minutes = 0)
    self.new(hour, minutes)
  end

  def -(given_minute)
    hour_and_minutes_array = given_minute.divmod(60)
    previous_hour = self.hour
    previous_minutes = self.minutes
    final_hour = previous_hour - hour_and_minutes_array[0]
    final_minutes = previous_minutes - hour_and_minutes_array[1]
    new_clock = Clock.at(final_hour, final_minutes)
    format_times_over_24_and_60(new_clock)
    new_clock
  end

  def +(minutes)
    previous_hour = self.hour
    previous_minutes = self.minutes
    new_clock = Clock.at(previous_hour, (previous_minutes + minutes))
    format_times_over_24_and_60(new_clock)
    new_clock
  end

  def to_s
    "#{format_times_as_string(@hour)}:#{format_times_as_string(@minutes)}"
  end

  def ==(new_clock_object)
     [self.hour, self.minutes] == [new_clock_object.hour, new_clock_object.minutes]
  end

  private

  def format_times_as_string(min_or_hour)
    if min_or_hour.digits.size == 1
      "0#{min_or_hour}"
    else
      "#{min_or_hour}"
    end
  end

  def format_times_over_24_and_60(new_clock)
    format_hour(new_clock)
    format_minutes(new_clock)
  end

  def format_hour(new_clock)
    loop do
      if new_clock.hour < 0
        new_clock.hour += 24
      elsif new_clock.hour >= 24
        new_clock.hour -= 24
      else
        break
      end
    end
  end

  def format_minutes(new_clock)
    loop do
      if new_clock.minutes >= 60
        new_clock.minutes -= 60
        new_clock.hour += 1
        format_hour(new_clock)
      elsif new_clock.minutes < 0
        new_clock.hour -= 1
        new_clock.minutes += 60
        format_hour(new_clock)
        format_minutes(new_clock)
      else
        break
      end
    end
  end
end
