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
# @return {Boolean}
def is_even_odd_tree(root)
  queue = [root]
  odd_level = false

  while(!queue.empty?)
    l = queue.length
    val_queue = queue.compact.map{|node| node.val}
    # print val_queue
    # puts '----'
    return false if val_queue.uniq.length != val_queue.length

    if odd_level
      return false if val_queue.sort.reverse != val_queue || val_queue.any?{|x| x % 2 == 1}
    else
      return false if val_queue.sort != val_queue || val_queue.any?{|x| x % 2 == 0}
    end

    odd_level = !odd_level

    for i in 0..l-1
      top = queue.shift
      next if top.nil?

      queue << top.left if !top.left.nil?
      queue << top.right if !top.right.nil?
    end
  end

  true
end
