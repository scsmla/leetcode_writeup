# @param {Integer} n
# @param {Integer[][]} roads
# @return {Integer}
# Link https://leetcode.com/problems/minimum-score-of-a-path-between-two-cities/description/
def min_score(n, roads)
  visited = Array.new(n+1, 0)
  graph = Hash.new

  for i in 0..roads.length-1
    x, y, dis = roads[i]
    graph[x] = [] if graph[x].nil?
    graph[y] = [] if graph[y].nil?
    graph[x].push([y, dis])
    graph[y].push([x, dis])
  end

  queue = [1]
  ans = 10**5
  while(!queue.empty?)
    top = queue.shift
    visited[top] = 1
    next if graph[top].nil?
    for i in 0..graph[top].length-1
      y, dis = graph[top][i]
      ans = [ans, dis].min
      queue.push(y) if visited[y] == 0
    end
  end

  ans
end
