# @param {String} s
# @param {Integer[][]} queries
# @return {Integer[]}
# Link: https://leetcode.com/problems/number-of-same-end-substrings/description/
def same_end_substring_count(s, queries)
  n = s.length
  prefix = Array.new(n+1){Array.new(26, 0)}

  for i in 1..n
    for j in 0..25
      prefix[i][j] = prefix[i-1][j]
    end
    prefix[i][s[i-1].ord-97] += 1
  end

  # print prefix

  res = []

  for i in 0..queries.length-1
    x, y = queries[i]
    curr = 0
    for j in 0..25
      cnt = prefix[y+1][j] - prefix[x][j]
      curr += (cnt) * (cnt+1) / 2
    end

    res << curr
  end

  res
end
