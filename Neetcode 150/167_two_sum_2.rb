# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
# Link: https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
def two_sum(numbers, target)
  n = numbers.length
  i = 0
  j = n-1

  while(i < j)
    if numbers[i] + numbers[j] > target
      j -= 1
    elsif numbers[i] + numbers[j] < target
      i += 1
    else
      return [i+1, j+1]
    end
  end
end
