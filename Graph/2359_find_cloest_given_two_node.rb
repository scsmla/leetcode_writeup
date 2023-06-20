# @param {Integer[]} edges
# @param {Integer} node1
# @param {Integer} node2
# @return {Integer}
# Link: https://leetcode.com/problems/find-closest-node-to-given-two-nodes/description/
def closest_meeting_node(edges, node1, node2)
  @graph = Hash.new
  for i in 0..edges.length-1
    @graph[i] = edges[i] if edges[i] != -1
  end

  @visited = Hash.new
  dis1 = Hash.new
  dfs(dis1, node1, 0)

  @visited = Hash.new
  dis2 = Hash.new
  dfs(dis2, node2, 0)

  min = 10**6
  min_i = -1
  for i in 0..edges.length-1
    next if dis1[i].nil? || dis2[i].nil?
    if [dis1[i], dis2[i]].max < min
      min = [dis1[i], dis2[i]].max
      min_i = i
    end
  end

  min_i
end

def dfs(dis, c_node, curr)
  return if !@visited[c_node].nil?
  @visited[c_node] = 1
  dis[c_node] = curr
  curr += 1

  return if @graph[c_node].nil?
  dfs(dis, @graph[c_node], curr)
end
