# @param {Integer[]} parents
# @return {Integer}
# Link: https://leetcode.com/problems/count-nodes-with-the-highest-score/description/
def count_highest_score_nodes(parents)
  tree = Hash.new
  n = parents.length
  for i in 0..n-1
    tree[parents[i]] = [] if tree[parents[i]].nil?
    tree[parents[i]] << i
  end

  count_child = Array.new(n){Array.new(2, 0)}
  dfs(0, tree, count_child)

  count = 0
  max = 0

  for i in 0..n-1
    left, right = count_child[i]
    remain = n-1-left-right
    left = 1 if left == 0
    right = 1 if right == 0
    remain = 1 if remain == 0

    if left * right * remain > max
      count = 1
      max = left * right * remain
    elsif left * right * remain == max
      count += 1
    end
  end

  count
end

def dfs(node, tree, count_child)
  if tree[node].nil?
    count_child[node][0] = 0
    count_child[node][1] = 0
    return 1
  end

  count_child[node][0] = dfs(tree[node][0], tree, count_child)
  count_child[node][1] = dfs(tree[node][1], tree, count_child) if tree[node].length > 1

  return 1 + count_child[node][0] + count_child[node][1]
end
