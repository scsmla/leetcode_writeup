# @param {Integer[]} arr
# @return {Integer}
# Link: https://leetcode.com/problems/number-of-sub-arrays-with-odd-sum/description/
def num_of_subarrays(arr)
  n = arr.length
  curr_sum = 0
  odd_sum = 0
  even_sum = 0
  res = 0

  if arr[0] % 2 == 1
    res += 1
    odd_sum += 1
  else
    even_sum += 1
  end

  for i in 1..n-1
    curr_sum += arr[i]

    if curr_sum % 2 == 1
      res += even_sum
      res += 1
      odd_sum += 1
    else
      res += odd_sum
      even_sum += 1
    end
  end

  res % (10**9 + 7)
end
