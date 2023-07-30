# @param {Integer[]} nums
# @param {Integer} p
# @return {Integer}
def min_subarray(nums, k)
  n = nums.length
  sum = nums.sum
  target = sum % k
  a = Hash.new
  a[0] = -1
  return 0 if target == 0
  return -1 if sum < k

  curr = 0
  ans = n

  for i in 0..n-1
    curr = (curr + nums[i]) % k
    a[curr] = i
    need = (curr - target + k) % k
    ans = [ans, i-a[need]].min if !a[need].nil?
  end

  ans < n ? ans : -1
end
