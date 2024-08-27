# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  n = nums.length
  min = nums.min
  present = Hash.new
  nums = nums.uniq

  for i in 0..n-1
    present[nums[i]] = 1
  end

  max = 0

  for i in 0..nums.length-1
    next if !present[nums[i]-1].nil?

    start, curr = nums[i], nums[i]

    while(!present[curr].nil?)
      curr += 1
    end

    max = [max, curr-start].max
  end

  max
end
