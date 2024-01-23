# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/longest-consecutive-sequence/description/
def longest_consecutive(nums)
  min = nums.min
  max = nums.max
  a = Hash.new
  n = nums.length
  res = 0

  nums.each do |num|
    a[num] = 1
  end

  nums = nums.uniq

  nums.each do |num|
    if a[num-1].nil?
      y = num+1
      while(!a[y].nil?)
        y += 1
      end

      res = [res, y-num].max
    end
  end

  res
end
