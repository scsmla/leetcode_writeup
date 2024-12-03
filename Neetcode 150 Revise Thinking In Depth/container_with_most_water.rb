# @param {Integer[]} height
# @return {Integer}
# Time complexity: O(n)
# Space complexity: O(1)

def max_area(height)
  n = height.length
  l = 0
  r = n-1
  max = 0

  while(l < r)
    curr_min = [height[l], height[r]].min
    max = [max, curr_min * (r - l)].max

    if height[l] > height[r]
      r -= 1
    else
      l += 1
    end
  end

  max
end
