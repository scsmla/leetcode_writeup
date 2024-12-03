# @param {Integer[][]} matrix
# @return {Integer}
def max_matrix_sum(matrix)
  n = matrix.length
  min = 10**5
  sum = 0
  count_neg = 0

  for i in 0..n-1
    for j in 0..n-1
      min = [min, matrix[i][j].abs].min
      sum += matrix[i][j].abs
      count_neg += 1 if matrix[i][j] < 0
    end
  end

  count_neg % 2 == 0 ? sum : sum - 2 * min
end
