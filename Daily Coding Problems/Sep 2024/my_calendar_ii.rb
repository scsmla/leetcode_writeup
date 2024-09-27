class MyCalendarTwo
  def initialize()
    @bookings = Array.new
  end

=begin
  :type start: Integer
  :type end: Integer
  :rtype: Boolean
=end
  def book(start_time, end_time)
    intersect = []

    for i in 0..@bookings.length-1
      next if valid_book_range(start_time, end_time, @bookings[i])

      intersect << [[start_time, @bookings[i][0]].max, [end_time, @bookings[i][1]].min]
    end

    intersect.sort_by!{|x| [x[0], x[1]]}

    if intersect.empty?
      @bookings.push([start_time, end_time])
      return true
    else
      prev = intersect[0][1]

      for i in 1..intersect.length-1
        return false if intersect[i][0] < prev
        prev = intersect[i][1]
      end

      @bookings.push([start_time, end_time])
      return true
    end
  end

  private

  def valid_book_range(start_time, end_time, booking)
    start_range = [start_time, booking[0]].max
    end_range = [end_time, booking[1]].min

    return false if start_range < end_range
    return true
  end
end

# Your MyCalendarTwo object will be instantiated and called as such:
# obj = MyCalendarTwo.new()
# param_1 = obj.book(start, end)
