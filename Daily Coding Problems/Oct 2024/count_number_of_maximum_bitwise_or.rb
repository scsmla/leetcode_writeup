# @param {Integer[]} nums
# @return {Integer}
def count_max_or_subsets(nums)
  max = 0
  dp = Array.new(2**20, 0)
  dp[0] = 1

  nums.each do |num|
    for i in max.downto(0)
      dp[i | num] += dp[i]
    end

    max |= num
  end

  dp[max]
end
