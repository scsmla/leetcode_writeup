# @param {Integer[]} arr
# @param {Integer} k
# @return {Boolean}
# Link: https://leetcode.com/problems/check-if-array-pairs-are-divisible-by-k/description/
def can_arrange(nums, k)
  a = Hash.new
  n = nums.length

  for i in 0..n-1
    a[nums[i] % k] = 0 if a[nums[i] % k].nil?
    a[nums[i] % k] += 1
  end

  for i in 0..n-1
    next if a[nums[i] % k].to_i == 0

    if nums[i] % k == 0

      return false if a[0].to_i <= 1
      a[0] -= 2
    else
      return false if a[k - nums[i]%k].to_i == 0
      a[k-nums[i]%k] -= 1
      a[nums[i]%k] -= 1
    end
  end

  true
end
