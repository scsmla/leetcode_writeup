# @param {Integer[]} nums
# @return {Integer}
#---------------------------------------------------------
# Time complexity: O(n)
# Space complexity: O(1)

def single_number(nums)
  curr = 0
  nums.each do |num|
    curr ^= num
  end

  curr
end
