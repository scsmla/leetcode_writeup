# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} start
# @return {Integer}
def amount_of_time(root, start)
  @graph = Hash.new
  build_graph(nil, root)
  print @graph
  queue = [start]
  visited = Hash.new
  visited[start] = 1
  time = -1

  while(!queue.empty?)
    l = queue.length

    for i in 0..l-1
      curr = queue.shift
      next if curr.nil?

      for j in 0..@graph[curr].length-1
        next if @graph[curr][j].nil? || visited[@graph[curr][j]]&.to_i == 1

        queue << @graph[curr][j]
        visited[@graph[curr][j]] = 1
      end
    end

    time += 1
  end

  time
end

def build_graph(parent, curr)
  return if curr.nil?

  @graph[curr.val] ||= []

  if !parent.nil?
    @graph[curr.val] << parent.val
    @graph[parent.val] ||= []
    @graph[parent.val] << curr.val
  end

  build_graph(curr, curr.left)
  build_graph(curr, curr.right)
end
