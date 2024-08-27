# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end
# @param {TreeNode} root
# @param {TreeNode} target
# @param {Integer} k
# @return {Integer[]}
def distance_k(root, target, k)
  @graph = Hash.new
  dfs(nil, root)
  level = 0
  res = []
  queue = [target]
  visited = Hash.new
  visited[target] = 1

  while(level < k)
    l = queue.length
    # print queue.map{|node| node.val}

    for i in 0..l-1
      top = queue.shift

      for j in 0..@graph[top].length-1
        next if @graph[top][j].nil? || @graph[top][j] == target || visited[@graph[top][j]].to_i == 1

        queue << @graph[top][j]
        visited[@graph[top][j]] = 1
      end
    end

    level += 1
  end

  queue.map{|node| node.val}
end

def dfs(parent, curr)
  return if curr.nil?

  @graph[curr] ||= []
  @graph[curr] << curr.left if !curr.left.nil?
  @graph[curr] << curr.right if !curr.right.nil?
  @graph[curr] << parent if !parent.nil?

  dfs(curr, curr.left)
  dfs(curr, curr.right)
end
