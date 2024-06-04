# @param {Integer} days
# @param {Integer[][]} meetings
# @return {Integer}
def count_days(days, meetings)
  n = meetings.length
  meetings = meetings.sort_by{|x| x[0]}
  prev = 0
  count = 0

  for i in 0..n-1
    count += meetings[i][0] - prev - 1 if meetings[i][0] > prev
    prev = [prev, meetings[i][1]].max
  end

  count += days - prev
  count
end
