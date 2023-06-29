# @param {Integer[]} candies
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-candies-allocated-to-k-children/description/
def maximum_candies(candies, k)
  l = 1
  r = candies.sum/k
  return 0 if candies.sum < k

  while(l <= r)
    mid = (l+r)/2

    if possible(candies, mid, k)
      l = mid+1
    else
      r = mid-1
    end
  end

  l-1
end

def possible(candies, num_can, k)
  curr = 0

  for i in 0..candies.length-1
    curr += candies[i]/num_can
  end

  curr >= k
end
