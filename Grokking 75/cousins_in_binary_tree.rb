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
# @param {Integer} x
# @param {Integer} y
# @return {Boolean}
def is_cousins(root, x, y)
  queue = [root]

  while(!queue.empty?)
    l = queue.length

    for i in 0..l-1
      top = queue.shift
      next if top.nil?

      queue << top.left if !top.left.nil?
      queue << top.right if !top.right.nil?

      return false if [top.left&.val, top.right&.val].compact.sort == [x, y].sort
    end

    val_queue = queue.compact.map{|x| x.val}

    return true if val_queue.include?(x) && val_queue.include?(y)
    return false if val_queue.include?(x) || val_queue.include?(y)
  end
end
