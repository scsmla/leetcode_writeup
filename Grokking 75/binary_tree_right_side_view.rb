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
def right_side_view(root)
  queue = [root]
  res = []

  while(!queue.empty?)
    l = queue.length
    # print queue.map{|x| x&.val}
    res << queue[-1].val if !queue[-1].nil?

    for i in 0..l-1
      top = queue.shift
      next if top.nil?

      queue << top.left if !top.left.nil?
      queue << top.right if !top.right.nil?
    end
  end

  res
end
