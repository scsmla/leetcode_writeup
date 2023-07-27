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
# Link: https://leetcode.com/problems/even-odd-tree/description/
def is_even_odd_tree(root)
  queue = [root]
  even = true

  while(!queue.empty?)
    l = queue.length
    print queue.map{|x| x.val}
    puts '----'
    for i in 0..l-1
      if even
        return false if queue[0].val % 2 == 0
      else
        return false if queue[0].val % 2 == 1
      end

      t = queue.shift
      queue.push(t.left) if !t.left.nil?
      queue.push(t.right) if !t.right.nil?

      next if queue.length == 0 || i == l-1

      if even == true
        return false if t.val >= queue[0].val
      else
        return false if t.val <= queue[0].val
      end
    end

    even = !even
  end

  true
end
