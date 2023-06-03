# @param {Integer[][]} ranges
# @return {Integer}
# Link: https://leetcode.com/problems/count-ways-to-group-overlapping-ranges/description/

def count_ways(ranges)
  n = ranges.length
  ranges = ranges.sort_by{|x| [x[0], x[1]]}
  count = 1
  prev = ranges[0][1]
  
  for i in 1..n-1
    count += 1 if ranges[i][0] > prev
    prev = [prev, ranges[i][1]].max
  end

  (2**count)%(10**9+7)
end
