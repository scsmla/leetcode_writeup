# @param {Integer[]} dist
# @param {Integer[]} speed
# @return {Integer}
# Link: https://leetcode.com/problems/eliminate-maximum-number-of-monsters/description/
def eliminate_maximum(dist, speed)
  n = dist.length
  time = Array.new(n, 0)

  for i in 0..n-1
    time[i] = dist[i].to_f/speed[i]
  end

  time = time.sort
  ans = 0

  for i in 0..n-1
    break if time[i] <= ans
    ans += 1
  end

  ans
end
