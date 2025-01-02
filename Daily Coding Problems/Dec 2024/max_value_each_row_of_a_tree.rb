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
# @return {Integer[]}
def largest_values(root)
  res = []
  return res if root.nil?

  queue = [root]

  while(!queue.empty?)
    res << queue.map{|x| x&.val.to_i}.max

    l = queue.length
    for i in 0..l-1
      top = queue.shift
      next if top.nil?

      queue << top.left if !top.left.nil?
      queue << top.right if !top.right.nil?
    end
  end

  res
end
