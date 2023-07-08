# @param {Integer[][]} events
# @return {Integer}
# Link: https://leetcode.com/problems/two-best-non-overlapping-events/description/
def max_two_events(events)
  vals = []

  for i in 0..events.length-1
    s,e,v = events[i]
    vals.push([s, true, v])
    vals.push([e+0.5, false, v])
  end

  vals = vals.sort_by{|x| x[0]}
  ans, m = 0, 0
  for i in 0..vals.length-1
    _, is_start, val = vals[i]

    if is_start
      ans = [ans, m+val].max
    else
      m = [m, val].max
    end
  end

  ans
end
