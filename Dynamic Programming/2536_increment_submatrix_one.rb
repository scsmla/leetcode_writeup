# @param {Integer} n
# @param {Integer[][]} queries
# @return {Integer[][]}
# Link: https://leetcode.com/problems/increment-submatrices-by-one/description/
def range_add_queries(n, queries)
  res = Array.new(n){Array.new(n, 0)}
  for i in 0..queries.length-1
    row1, col1, row2, col2 = queries[i]

    for j in row1..row2
      res[j][col1] += 1
      res[j][col2+1] -= 1 if col2 + 1 < n
    end
  end

  for i in 0..n-1
    for j in 1..n-1
      res[i][j] += res[i][j-1]
    end
  end

  res
end
