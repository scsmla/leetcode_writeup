# @param {Character[][]} maze
# @param {Integer[]} entrance
# @return {Integer}
# Link: https://leetcode.com/problems/nearest-exit-from-entrance-in-maze/description/
def nearest_exit(maze, entrance)
  m, n = maze.length, maze[0].length
  queue = [entrance]
  visited = Hash.new
  curr = 0
  dirs = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  visited[entrance] = 1

  while(!queue.empty?)
    l = queue.length

    for i in 0..l-1
      x, y = queue.shift

      return curr if (x == 0 || x == m-1 || y == 0 || y == n-1) && [x, y] != entrance

      for j in 0..dirs.length-1
        dir_x, dir_y = dirs[j]
        if x + dir_x >= 0 && x + dir_x <= m-1 && y + dir_y >= 0 && y + dir_y <= n-1 &&
          maze[x+dir_x][y+dir_y] == '.'  &&
          visited[[x+dir_x, y+dir_y]].nil?

          queue.push([x+dir_x, y+dir_y])
          visited[[x+dir_x, y+dir_y]] = 1
        end
      end
    end

    curr += 1
  end

  return -1
end
