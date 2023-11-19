# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-seconds-to-equalize-a-circular-array/description/
def minimum_seconds(nums)
  a = Hash.new
  n = nums.length
  res = 10 ** 5

  for i in 0..n-1
    a[nums[i]] = [] if a[nums[i]].nil?
    a[nums[i]] << i
  end

  a.each do |k, v|
    v.push(v[0] + n)
    max = 0
    for i in 1..v.length-1
      max = [max, v[i] - v[i-1]].max
    end

    res = [res, max/2].min
  end

  res
end
