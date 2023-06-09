# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/distinct-prime-factors-of-product-of-array/description/
def distinct_prime_factors(nums)
  sieves = Array.new(1001, 0)
  for i in 2..Math.sqrt(1001).to_i+1
    j = i * i
    while(j <= 1000)
      sieves[j] = 1
      j += i
    end
  end

  n = nums.length
  primes = []
  for j in 2..1000
    primes.push(j) if sieves[j] == 0
  end
  visited = Array.new(primes.length, 0)

  for i in 0..n-1
    j = 0
    while(nums[i] > 1)
      if nums[i] % primes[j] == 0
        visited[j] = 1
        while(nums[i] % primes[j] == 0)
          nums[i] /= primes[j]
        end
      end
      j += 1
    end
  end

  res = 0
  for j in 0..visited.length-1
    res += 1 if visited[j] == 1
  end

  res
end
