# @param {Integer[][]} grid
# @param {Integer} k
# @return {Integer}
def shortest_path(grid, k)
  m, n = grid.length, grid[0].length
  queue = [[0, 0, 0]]
  visited = Array.new(m){Array.new(n){Array.new(k+1, 0)}}
  visited[0][0][0] = 1
  dirs = [[0, 1], [1, 0], [-1, 0], [0, -1]]
  count = 0

  while(!queue.empty?)
    l = queue.length

    for i in 0..l-1
      curr_x, curr_y, curr_k = queue.shift
      return count if curr_x == m-1 && curr_y == n-1

      dirs.each do |dx, dy|
        new_x = curr_x + dx
        new_y = curr_y + dy

        next if new_x < 0 || new_y < 0 || new_x >= m || new_y >= n

        if grid[new_x][new_y] == 1
          new_k = curr_k + 1
        else
          new_k = curr_k
        end

        next if new_k > k || visited[new_x][new_y][new_k] == 1

        queue << [new_x, new_y, new_k]
        visited[new_x][new_y][new_k] = 1
      end
    end

    count += 1
  end

  return -1
end
