# @param {Integer[][]} matrix
# @return {Integer}
def max_equal_rows_after_flips(matrix)
  @flip = Hash.new
  m, n = matrix.length, matrix[0].length
  max = 0

  for i in 0..m-1
    temp = matrix[i].dup

    for k in 0..temp.length-1
      temp[k] = 1 - matrix[i][k]
    end

    @flip[i] = temp
  end

  for i in 0..m-1
    cnt = 1

    for j in i+1..m-1
      cnt += 1 if same_pattern(matrix, i, j)
    end

    max = [max, cnt].max
  end

  max
end

def same_pattern(matrix, i, j)
  return true if matrix[i] == matrix[j] || @flip[i] == matrix[j]

  false
end
