# @param {Integer[][]} bombs
# @return {Integer}
# Link: https://leetcode.com/problems/detonate-the-maximum-bombs/description/
def maximum_detonation(bombs)
  n = bombs.length
  graph = Array.new(n){Array.new}
  for i in 0..n-1
    x1, y1, r1 = bombs[i]
    for j in 0..n-1
      next if i == j
      x2, y2, r2 = bombs[j]

      distance = Math.sqrt((x1-x2)**2 + (y1-y2)**2)
      if distance <= r1
        graph[i] << j
      end
    end
  end
  max = 0
  for i in 0..n-1
    queue = [i]
    visited = Array.new(n , 0)
    while(!queue.empty?)
      top = queue.shift
      next if visited[top] == 1

      visited[top] = 1
      for j in 0..graph[top].length-1
        queue << graph[top][j]
      end
    end

    cnt = visited.count(1)
    max = [cnt, max].max
  end

  max
end
