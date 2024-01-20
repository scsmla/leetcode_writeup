# Link: https://leetcode.com/problems/top-k-frequent-elements/description/
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  n = nums.length
  a = Hash.new

  for i in 0..n-1
    a[nums[i]] = 0 if a[nums[i]].nil?
    a[nums[i]] += 1
  end

  a.sort_by {|_key, value| value}.reverse[0..k-1].map(&:first)
end
