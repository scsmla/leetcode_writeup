# @param {Integer[]} nums
# @return {Boolean}
# Time complexity: O(n)
# Space complexity: O(n)
def contains_duplicate(nums)
  a = Hash.new
  nums.each do |num|
    a[num] ||= 0
    a[num] += 1
    return true if a[num] >= 2
  end

  false
end
