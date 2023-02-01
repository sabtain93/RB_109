

=begin
The time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight. If the number of minutes 
is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day 
in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Examples:

Copy Code
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
Disregard Daylight Savings and Standard Time and other complications.

Problem:
input: integer
output: string

rules:
- given an integer which are the minutes
- return the tiem of the day in 24 hr format
- if input is negative time is before midnight
- if the output is positive the time is after midnight
- if 0 the time is "00:00"
- there are 1440 mins in a day
- the input can be any integer

Examples:
35.divmod(1440)

data:
integrs
string

algo:
- create a helper method:
- define normalize
  - until the input integer > 1440
    - get the remainder of integer with 1440
    - reassign the variable that references the input integer
  - return the remainder that is less than 1440

- main method
- check if te input number is less than 0
  - if greater than 1440 
    - normalize the input
  - subtract the return value of normalize from 1440
  - the result should be divided by 60
  - the qoutient is hours
  - the remainder is mins
- check if input number is positive
  - if greater than 1440 
    - normalize the input
  - the return value of normalize from 1440 divide by 60
  - the qoutient is hours
  - the remainder is mins

- return the the hours and mins in string format
=end

MINUTES_PER_DAY = 1440

MINUTES_PER_HOUR = 60


def normalize(minutes)

  while minutes > MINUTES_PER_DAY do
    minutes = minutes % MINUTES_PER_DAY
  end
  minutes
end

def time_of_day(minutes)
  if minutes < 0
    minutes = normalize(-minutes) if -minutes > MINUTES_PER_DAY
    minutes = -minutes if minutes < 0
    minutes = MINUTES_PER_DAY - minutes
    hour, min = minutes.divmod(MINUTES_PER_HOUR)
  elsif minutes > 0
    minutes = normalize(minutes) if minutes > MINUTES_PER_DAY
    hour, min = minutes.divmod(MINUTES_PER_HOUR)
  else
    return '00:00'
  end
  hour.to_s.rjust(2, '00') + ":" + min.to_s.rjust(2, '00')
end



p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
 p time_of_day(1440) #== "01:29"
