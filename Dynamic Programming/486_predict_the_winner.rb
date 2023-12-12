# @param {Integer[]} nums
# @return {Boolean}
# Link: https://leetcode.com/problems/predict-the-winner/description/
def predict_the_winner(nums)
  n = nums.length
  @memos = Array.new(n){Array.new(n, -1)}

  return get_diff(nums, 0, n-1) >= 0
end

def get_diff(nums, left, right)
  return 0 if left > right
  return @memos[left][right] if @memos[left][right] != -1

  val_left = nums[left] - get_diff(nums, left+1, right)
  val_right = nums[right] - get_diff(nums, left, right-1)

  @memos[left][right] = [val_left, val_right].max

  return @memos[left][right]
end
