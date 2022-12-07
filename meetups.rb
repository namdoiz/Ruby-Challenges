=begin
Meetups

Meetups are a great way to meet people who share a common interest. Typically, meetups happen monthly on the same day of the week. 
For example, a meetup's meeting may be set as:

The first Monday of January 2021
The third Tuesday of December 2020
The teenth wednesday of December 2020
The last Thursday of January 2021

In this program, we'll construct objects that represent a meetup date. Each object takes a month number (1-12) and a year (e.g., 2021). 
Your object should be able to determine the exact date of the meeting in the specified month and year. For instance, if you ask for the 
2nd Wednesday of May 2021, the object should be able to determine that the meetup for that month will occur on the 12th of May, 2021.

The descriptors that may be given are strings: 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'. The case of the strings 
is not important; that is, 'first' and 'fIrSt' are equivalent. Note that "teenth" is a made up word. There was a meetup whose members realised 
that there are exactly 7 days that end in '-teenth'. Therefore, it's guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly 
one date that is the "teenth" of that day in every month. That is, every month has exactly one "teenth" Monday, one "teenth" Tuesday, etc. 
The fifth day of the month may not happen every month, but some meetup groups like that irregularity.

The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', and 'Sunday'. 
Again, the case of the strings is not important.

Things needed
  - Meetup class that takes a year and a month in integers
  - a day instance method that takes two arguments 
    - a day of the week in string (case does not matter)
    - descriptor such as 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'
  algorithm
    - get the year and the month you need to check a day for
    - get the weekday and the descriptor you want
    - search the date standard library for the day that was passed as an argument to the day instance method
      - date = the first day of the month for the year that was passed
      - if the descriptor is first then get the first weekday that was passsed
      - same with second, third, fourth, fifth
        - count = 0
        - create a loop add one to the date
        - increase count when the weekday that is given is reached
        - if the date is the same as the weekday that youre given then add one to the count until the count is the same as the 
          descriptor assuming the descriptor is not teenth
          - how to map the string to the method
            - if the string is monday then ask if the date is a monday and the count is the same as the descriptor
          - how to map the count to the descriptor
            - if the descriptor is first then a count of 1 is fine
            - if the descriptor is second then when the count reaches 2 then return
        - if the descriptor is teenth then check 
      - if the descriptor is 'teenth' then get the first weekday that was passed in that when you call the mday instance method on it returns 
        either 13, 14, 15, 16, 17, 18, or 19
      -


      if the weekday is the same as the given weekday then increase the count
      if the count is the same thing as the number maped to the discriptor then break out of the loop
        for the last, go throught the month and 
      if the descriptor is the same as teenth then
         - add one to the date until the date's day is the same as eithter 13, 14 , 15,16 17 or 18 or 19
         - return the date is the date.cwday is the same as the weeday given and the TEENTHS array includes the date.mday integer

=end

require 'date'

class Meetup
  WEEKDAYS = {1 => 'monday', 2 => 'tuesday', 3 => 'wednesday', 4 => 'thursday', 5 => 'friday', 6 => 'saturday', 7 => 'sunday'}
  DESCRIPTOR = {0 => 'first', 1 => 'second', 2 => 'third', 3 => 'fourth', 4 => 'fifth', -1 => 'last'}
  TEENTHS = [13, 14, 15, 16, 17, 18, 19]

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(week_day, descriptor)
    if descriptor.downcase == 'teenth'
      initial_month_num = Date.new(@year, @month, 1).month
      initial_year_num = Date.new(@year, @month, 1).year
      date = Date.new(@year, @month, 1)
      loop do
        return date if date.cwday == WEEKDAYS.key(week_day.downcase) && TEENTHS.include?(date.mday)
        date += 1
        break if date.month > initial_month_num || date.year > initial_year_num
      end
    else
      initial_month_num = Date.new(@year, @month, 1).month
      initial_year_num = Date.new(@year, @month, 1).year
      date = Date.new(@year, @month, 1)
      days_arr = []
      loop do
        days_arr << date.clone if date.cwday == WEEKDAYS.key(week_day.downcase)
        date += 1
        break if date.month > initial_month_num || date.year > initial_year_num
      end
      if days_arr.empty?
        return nil
      else
        days_arr[DESCRIPTOR.key(descriptor.downcase)]
      end
    end
  end
end
