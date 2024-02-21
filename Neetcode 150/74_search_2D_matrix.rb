# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  m, n = matrix.length, matrix[0].length
  l = 0
  r = m-1
  mid = 0

  while(l <= r)
    return false if target > matrix[r][-1] || target < matrix[l][0]

    mid = (l+r)/2

    if matrix[mid][0] <= target && target <= matrix[mid][-1]
      break
    elsif matrix[mid][0] > target
      r = mid-1
    else
      l = mid+1
    end
  end

  l = 0
  r = n-1

  while(l <= r)
    return false if target > matrix[mid][r] || target < matrix[mid][0]

    mid_c = (l+r)/2
    return true if target == matrix[mid][mid_c]

    if target > matrix[mid][mid_c]
      l = mid_c + 1
    else
      r = mid_c - 1
    end
  end

  false
end
