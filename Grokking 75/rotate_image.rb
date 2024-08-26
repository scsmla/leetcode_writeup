# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  row, col = matrix.length, matrix[0].length
  dirs = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  visited = Array.new(row) { Array.new(col, 0) }
  spiral = []
  count = 0
  idx = 0
  x, y = 0, -1

  while(count < row * col)
    dx, dy = dirs[idx]

    if x + dx >= row || y + dy >= col || x + dx < 0 || y + dy < 0 || visited[x + dx][y + dy] == 1
      idx = (idx+1) % 4
    else
      spiral << matrix[x+dx][y+dy]
      visited[x + dx][y + dy] = 1
      x += dx
      y += dy
      count += 1
    end
  end

  x, y = 1, col-1
  idx = 3
  count = 0
  visited = Array.new(row) { Array.new(col, 0) }

  while(count < row * col)
    dx, dy = dirs[idx]

    if x + dx >= row || y + dy >= col || x + dx < 0 || y + dy < 0 || visited[x + dx][y + dy] == 1
      idx = (idx+1) % 4
    else
      visited[x+dx][y+dy] = 1
      matrix[x+dx][y+dy] = spiral[count]
      x += dx
      y += dy
      count += 1
    end
  end
end
