# @param {Integer[]} piles
# @param {Integer} h
# @return {Integer}
def min_eating_speed(piles, h)
  n = piles.length
  l = 1
  r = piles.max

  while(l < r)
    mid = (l+r)/2

    if possible(mid, piles, h)
      r = mid
    else
      l = mid+1
    end
  end

  l
end

def possible(v, piles, h)
  sum = 0

  for i in 0..piles.length-1
    sum += (piles[i].to_f / v).ceil
  end

  sum <= h
end
