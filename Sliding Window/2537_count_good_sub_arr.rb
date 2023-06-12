# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/count-the-number-of-good-subarrays/description/
def count_good(nums, k)
  n = nums.length
  res = 0
  a = Hash.new
  curr = 0
  i, j = 0, 0
  while(j < n)
    a[nums[j]] = 0 if a[nums[j]].nil?
    a[nums[j]] += 1
    curr += a[nums[j]] - 1

    while(i < j && curr >= k)
      res += n-j
      a[nums[i]] -= 1
      curr -= a[nums[i]]
      i += 1
    end
    j += 1
  end

  res
end
