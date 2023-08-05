# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def num_subseq(nums, target)
  res = 0
  mod = 10**9 + 7
  nums = nums.sort
  n = nums.length
  pows = Array.new(n)
  pows[0] = 1

  for i in 1..n-1
    pows[i] = pows[i-1] * 2 % mod
  end

  l = 0
  r = n-1

  while(l <= r)
    if nums[l] + nums[r] > target
      r -= 1
    else
      res += pows[r-l]
      l += 1
      res %= mod
    end
  end

  res % mod
end
