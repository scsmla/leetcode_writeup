# @param {Integer[][]} mat
# @return {Integer[]}
# Link: https://leetcode.com/problems/find-a-peak-element-ii/description/
def find_peak_grid(mat)
  m, n = mat.length, mat[0].length
  l = 0
  r = n-1

  while(l <= r)
    mid = (l+r)/2
    max_row = 0

    for i in 1..m-1
      if mat[max_row][mid] < mat[i][mid]
        max_row = i
      end
    end

    if (mid == 0 || mat[max_row][mid] > mat[max_row][mid-1]) &&
       (mid == n-1 || mat[max_row][mid] > mat[max_row][mid+1])
      return [max_row, mid]
    elsif mid > 0 && mat[max_row][mid] < mat[max_row][mid-1]
      r = mid-1
    else
      l = mid+1
    end
  end

  return [-1, -1]
end
