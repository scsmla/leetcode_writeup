# @param {Integer} n
# @param {Integer[]} quantities
# @return {Integer}
# Link: https://leetcode.com/problems/minimized-maximum-of-products-distributed-to-any-store/description/
def minimized_maximum(n, quantities)
  l = 0
  r = quantities.max

  if n == 1
    return 0 if quantities.length > 1
    return quantities[0]
  end

  while(l < r)
    mid = (l+r)/2
    res = 0
    if mid == 0
      l = 1
      break
    end
    for i in 0..quantities.length-1
      res += (quantities[i].to_f/mid).ceil
      break if res > n
    end

    possible = res <= n

    if possible
      r = mid
    else
      l = mid+1
    end
  end

  l
end
