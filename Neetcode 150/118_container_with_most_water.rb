# @param {Integer[]} height
# @return {Integer}
# Link: https://leetcode.com/problems/container-with-most-water/description/
def max_area(height)
  i = 0
  n = height.length
  j = n-1
  max = 0

  while(i < j)
    if height[i] < height[j]
      max = [height[i] * (j-i), max].max
      i += 1
    else
      max = [height[j] * (j-i), max].max
      j -= 1
    end
  end

  max
end
