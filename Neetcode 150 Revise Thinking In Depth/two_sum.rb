# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  n = nums.length

  #---------------------------------------------------------
  # Time complexity: O(n2)
  # Space complexity: O(1)

  # for i in 0..n-1
  #   for j in i+1..n-1
  #     return [i, j] if nums[i] + nums[j] == target
  #   end
  # end
  # ---------------------------------------------------------



  #---------------------------------------------------------
  # Time complexity: O(n)
  # Space complexity: O(n)
  hash_map = {}

  for i in 0..n-1
    return [i, hash_map[target-nums[i]]] if !hash_map[target-nums[i]].nil?

    hash_map[nums[i]] = i
  end
  #---------------------------------------------------------
end
