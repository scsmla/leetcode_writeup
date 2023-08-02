# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/find-the-winner-of-an-array-game/
def get_winner(arr, k)
  n = arr.length
  curr = arr[0]
  w = 0

  for i in 1..n-1
    if arr[i] > curr
      w = 0
      curr = arr[i]
    end

    w += 1
    break if w == k
  end

  curr
end
