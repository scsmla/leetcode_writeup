# @param {Integer[]} edges
# @return {Integer}
# Link: https://leetcode.com/problems/node-with-highest-edge-score/description/
def edge_score(edges)
  a = Hash.new
  max = 0
  max_i = 0
  for i in 0..edges.length-1
    a[edges[i]] = 0 if a[edges[i]].nil?
    a[edges[i]] += i
    if a[edges[i]] > max
      max = a[edges[i]]
    end
  end

  for i in 0..edges.length-1
    return i if a[i] == max
  end
end
