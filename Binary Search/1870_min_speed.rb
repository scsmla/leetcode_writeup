# @param {Integer[]} dist
# @param {Float} hour
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-speed-to-arrive-on-time/
def min_speed_on_time(dist, hour)
  n = dist.length
  return -1 if hour < n-1 || hour == 1.0 && dist.length >= 2

  l = 1
  r = 10**7

  while(l < r)
    mid = (l+r)/2
    curr = 0

    for i in 0..n-2
      curr += (dist[i].to_f/mid).ceil
    end

    curr += dist[-1].to_f/mid

    if curr <= hour
      r = mid
    else
      l = mid + 1
    end
  end

  l
end
