# @param {Integer[][]} nums
# @return {Integer[]}
# Link: https://leetcode.com/problems/diagonal-traverse-ii/description/
def find_diagonal_order(nums)
  m = nums.length
  res = []
  buc = Hash.new
  max = 0

  for i in 0..m-1
    for j in 0..nums[i].length-1
      buc[i+j] = [] if buc[i+j].nil?
      buc[i+j] << nums[i][j]
      max = [max, i+j].max
    end
  end

  for i in 0..max
    next if buc[i].nil?

    for j in (buc[i].length-1).downto(0)
      res.push(buc[i][j])
    end
  end

  res
end
