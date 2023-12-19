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
# @return {Integer[][]}
# Link: https://leetcode.com/problems/binary-tree-vertical-order-traversal/description/
def vertical_order(root)
  map = Hash.new
  return [] if root.nil?
  queue = [[root, 0]]

  while(!queue.empty?)
    l = queue.length

    for i in 0..l-1
      top = queue.shift
      next if top.nil?
      node, col = top

      map[col] = [] if map[col].nil?
      map[col] << node.val
      queue.push([node.left, col-1]) if !node.left.nil?
      queue.push([node.right, col+1]) if !node.right.nil?
    end
  end

  map.sort_by{|k, v| k}.to_a.map{|x| x[1]}
end
