# @param {Integer[]} card_points
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-points-you-can-obtain-from-cards/description/
def max_score(card_points, k)
  n = card_points.length
  prefix_sum = Array.new(n+1, 0)
  postfix_sum = Array.new(n+1, 0)
  curr_pre = 0
  curr_post = 0

  for i in 0..n-1
    curr_pre += card_points[i]
    curr_post += card_points[n-1-i]
    prefix_sum[i+1] = curr_pre
    postfix_sum[i+1] = curr_post
  end

  max = 0

  for i in 0..k
    max = [max, prefix_sum[i] + postfix_sum[k-i]].max
  end

  max
end
