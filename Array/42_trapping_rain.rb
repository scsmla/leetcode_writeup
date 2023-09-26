# @param {Integer[]} height
# @return {Integer}
def trap(height)
  max_l = 0
  max_r = 0
  n = height.length
  l = 0
  r = n-1
  total = 0

  while(l < r)
    if height[l] <= height[r]
      if height[l] >= max_l
        max_l = height[l]
      else
        total += max_l - height[l]
      end
      l += 1
    else
      if height[r] >= max_r
        max_r = height[r]
      else
        total += max_r - height[r]
      end
      r -= 1
    end
  end

  total
end
