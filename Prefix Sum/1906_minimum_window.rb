# @param {Integer[]} nums
# @param {Integer[][]} queries
# @return {Integer[]}
# Link: https://leetcode.com/problems/minimum-absolute-difference-queries/
def min_difference(nums, queries)
  n = queries.length
  m = nums.length
  count = Array.new(m){Array.new(101, 0)}
  count[0][nums[0]] = 1

  for i in 1..m-1
    for j in 1..100
      count[i][j] = count[i-1][j]

      if j == nums[i]
        count[i][j] += 1
      end
    end
  end

  ans = Array.new(n, -1)

  for i in 0..n-1
    s, e = queries[i]
    prev, curr = nil, nil
    min = 100

    for j in 1..100
      if s == 0
        cnt = count[e][j]
      else
        cnt = count[e][j] - count[s-1][j]
      end

      if cnt > 0
        prev = curr
        curr = j
      end

      if !prev.nil?
        min = [curr-prev, min].min
      end
    end

    ans[i] = prev.nil? ? -1 : min
  end

  ans
end
