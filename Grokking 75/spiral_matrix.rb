# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  row, col = matrix.length, matrix[0].length
  dirs = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  visited = Array.new(row) { Array.new(col, 0) }
  res = []
  count = 0
  idx = 0
  x, y = 0, -1

  while(count < row * col)
    dx, dy = dirs[idx]

    if x + dx >= row || y + dy >= col || x + dx < 0 || y + dy < 0 || visited[x + dx][y + dy] == 1
      idx = (idx+1) % 4
    else
      res << matrix[x+dx][y+dy]
      visited[x + dx][y + dy] = 1
      x += dx
      y += dy
      count += 1
    end
  end

  res
end
