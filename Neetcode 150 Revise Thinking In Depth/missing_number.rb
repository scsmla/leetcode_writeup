# @param {Integer[]} nums
# @return {Integer}
# Time complexity: O(n)
# Space complexity: O(n)
def missing_number(nums)
  n = nums.length
  mark = Hash.new

  nums.each do |num|
    mark[num] = 1
  end

  for i in 0..n
    return i if mark[i].nil?
  end
end


# @param {Integer[]} nums
# @return {Integer}
# Time complexity: O(n)
# Space complexity: O(1)
def missing_number(nums)
  n = nums.length
  n * (n+1) / 2 - nums.sum
end

# Time complexity: O(n)
# Space complexity: O(1)
def missing_number(nums)
  res = nums.length

  nums.each_with_index do |num, i|
    res ^= num
    res ^= i
  end

  res
end
