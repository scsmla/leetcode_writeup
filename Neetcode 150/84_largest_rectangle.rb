# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
  n = heights.length
  left = Array.new(n, 0)
  right = Array.new(n, 0)
  left[0] = -1
  right[n-1] = n

  for i in 1..n-1
    curr = i-1

    while(curr >= 0 && heights[curr] >= heights[i])
      curr = left[curr]
    end

    left[i] = curr
  end

  for i in (n-2).downto(0)
    curr = i+1

    while(curr < n && heights[curr] >= heights[i])
      curr = right[curr]
    end

    right[i] = curr
  end

  max = 0

  for i in 0..n-1
    max = [max, (right[i] - left[i] - 1) * heights[i]].max
  end

  max
end
