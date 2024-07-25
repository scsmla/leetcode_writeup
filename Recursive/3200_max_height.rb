# @param {Integer} red
# @param {Integer} blue
# @return {Integer}
def max_height_of_triangle(red, blue)
  r, b = red, blue
  sum1 = 0
  n = 1
  is_red = true

  while(true)
    break if r < n && is_red
    break if b < n && !is_red

    if(is_red)
      r -= n
    else
      b -= n
    end
    sum1 += 1
    is_red = !is_red
    n += 1
  end

  is_blue = true
  n = 1
  sum2 = 0
  r, b = red, blue

  while(true)
    break if b < n && is_blue
    break if r < n && !is_blue

    if(is_blue)
      b -= n
    else
      r -= n
    end

    sum2 += 1
    is_blue = !is_blue
    n += 1
  end

  [sum1, sum2].max
end
