# @param {Integer[]} prize_positions
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/maximize-win-from-two-segments/
def maximize_win(prize_positions, k)
  n = prize_positions.length
  dp = Array.new(n+1, 0)
  max = 0
  left = 0
  right = 0
  for right in 0..n-1
    while(prize_positions[left] < prize_positions[right] - k)
      left += 1
    end

    cur_prize = right-left+1
    dp[right+1] = [dp[right], cur_prize].max
    max = [max, cur_prize + dp[left]].max
  end

  max
end
