# @param {Integer[]} time
# @param {Integer} total_trips
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-time-to-complete-trips/description/
def minimum_time(time, total_trips)
  l = 1
  r = time.min * total_trips
  while(l < r)
    mid = (l+r)/2
    possible = false
    curr = 0
    for i in 0..time.length-1
      curr += mid/time[i]
      break if curr >= total_trips
    end

    possible = curr >= total_trips

    if possible
      r = mid
    else
      l = mid+1
    end
  end

  l
end
