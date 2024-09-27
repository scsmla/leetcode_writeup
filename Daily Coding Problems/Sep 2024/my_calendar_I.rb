class MyCalendar
  def initialize()
    @bookings = Array.new
  end


=begin
  :type start: Integer
  :type end: Integer
  :rtype: Boolean
=end
  def book(start_time, end_time)
    for i in 0..@bookings.length-1
      return false if check_dup(start_time, end_time, @bookings[i])
    end

    @bookings.push([start_time, end_time])
    @bookings.sort_by{|x| x[0]}
    return true
  end

  private

  def check_dup(start_time, end_time, current_booking)
    return true if start_time < current_booking[0] && end_time > current_booking[0]
    return true if start_time >= current_booking[0] && end_time <= current_booking[1]
    return true if start_time < current_booking[1] && end_time > current_booking[1]
    return false
  end
end

# Your MyCalendar object will be instantiated and called as such:
# obj = MyCalendar.new()
# param_1 = obj.book(start, end)
