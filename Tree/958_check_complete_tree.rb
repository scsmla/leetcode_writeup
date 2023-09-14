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
# Link: https://leetcode.com/problems/check-completeness-of-a-binary-tree/
def is_complete_tree(root)
  level = check_level(root)-1
  curr = 0
  queue = [root]
  while(!queue.empty?)
    return false if 2 ** curr != queue.length && curr < level

    l = queue.length

    if curr == level - 1
      for i in 0..l-1
        top = queue[i]
        return false if top.left.nil? && !top.right.nil?

        if top.left.nil? || top.right.nil?
            for j in i+1..l-1
              return false if !queue[j].left.nil? || !queue[j].right.nil?
            end
        end
      end

      break
    else
      for i in 0..l-1
        top = queue.shift
        next if top.nil?

        queue.push(top.left) if !top.left.nil?
        queue.push(top.right) if !top.right.nil?
      end

      curr += 1
    end
  end
  true
end

def check_level(root)
  return 0 if root.nil?
  return [1 + check_level(root.left), 1 + check_level(root.right)].max
end
