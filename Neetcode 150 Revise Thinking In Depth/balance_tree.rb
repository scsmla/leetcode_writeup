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
# Time complexity: O(n)
# Space complexity: O(n)
def is_balanced(root)
  helper(root) != -1
end

def helper(root)
  return 0 if root.nil?

  left = helper(root.left)
  right = helper(root.right)

  return -1 if left == -1 || right == -1 || (left-right).abs > 1
  1 + [left, right].max
end


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
# Time complexity: O(n^2)
# Space complexity: O(n^2)
def is_balanced(root)
  return true if root.nil?

  height_left = get_height(root.left)
  height_right = get_height(root.right)

  return false if (height_left - height_right).abs > 1
  return is_balanced(root.left) && is_balanced(root.right)
end

def get_height(root)
  return 0 if root.nil?
  return 1 + [get_height(root.left), get_height(root.right)].max
end
