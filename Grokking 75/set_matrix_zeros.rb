# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  m, n = matrix.length, matrix[0].length

  for i in 0..m-1
    for j in 0..n-1
      if matrix[i][j] == 0
        for a in 0..m-1
          matrix[a][j] = 'A' if matrix[a][j] != 0
        end

        for b in 0..n-1
          matrix[i][b] = 'A' if matrix[i][b] != 0
        end
      end
    end
  end

  for i in 0..m-1
    for j in 0..n-1
      if matrix[i][j] == 'A'
        matrix[i][j] = 0
      end
    end
  end
end
