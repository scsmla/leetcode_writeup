# @param {Integer} n
# @param {Integer[]} quantities
# @return {Integer}
def minimized_maximum(n, quantities)
  m = quantities.length
  l = 1
  r = quantities.max

  while(l < r)
    mid = (l+r)/2

    if valid?(n, quantities, mid)
      r = mid
    else
      l = mid + 1
    end
  end

  l
end

def valid?(n, quantities, max)
  count = 0

  for i in 0..quantities.length-1
    count += quantities[i]/max
    count += 1 if quantities[i] % max > 0

    return false if count > n
  end

  count <= n
end
