# @param {String[]} nums
# @return {String}
# Link: https://leetcode.com/problems/find-unique-binary-string/description/
def find_different_binary_string(nums)
  n = nums.length
  max = 2**n-1
  a = Hash.new
  for i in 0..nums.length-1
    a[nums[i].to_i(2)] = 1
  end

  for i in max.downto(0)
    if a[i].nil?
      res = i.to_s(2)
      return res.length < n ? '0'*(n-res.length) + res : res
    end
  end
end
