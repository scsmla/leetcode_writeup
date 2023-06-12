# @param {Integer[]} vals
# @param {Integer[][]} edges
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-star-sum-of-a-graph/description/
def max_star_sum(vals, edges, k)
  graph = Hash.new

  for i in 0..edges.length-1
    x, y = edges[i]
    graph[x] = [] if graph[x].nil?
    graph[x].push(y)
    graph[y] = [] if graph[y].nil?
    graph[y].push(x)
  end

  max = -10**5
  vals.each_with_index do |val, idx|
    adj = graph[idx]
    if adj.nil? || k == 0
      max = [max, val].max
    else
      vv = []
      for i in 0..adj.length-1
        vv.push(vals[adj[i]]) if vals[adj[i]] > 0
      end
      vv = vv.sort.reverse
      max = [max, val+vv[0..k-1].sum].max
    end
  end

  max
end
