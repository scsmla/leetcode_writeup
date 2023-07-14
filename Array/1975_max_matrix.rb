# @param {Integer[][]} matrix
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-matrix-sum/description/
def max_matrix_sum(matrix)
  n = matrix.length
  neg = 0
  max = -10**9
  min = 10**9
  sum = 0
  c_0 = 0
  for i in 0..n-1
    for j in 0..n-1
      if matrix[i][j] < 0
        neg += 1
        max = [max, matrix[i][j]].max
      elsif matrix[i][j] == 0
        c_0 += 1
      else
        min = [min, matrix[i][j]].min
      end
      sum += matrix[i][j].abs
    end
  end

  if neg % 2 == 1 && c_0 == 0
    if max.abs > min
      sum - 2*min
    else
      sum + 2*max
    end
  else
    return sum
  end
end
