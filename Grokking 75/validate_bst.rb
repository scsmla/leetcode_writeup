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
def is_valid_bst(root)
  is_valid(root, -10**15, 10 ** 15)
end

def is_valid(root, min_val, max_val)
  return true if root.nil?
  return false if root.val <= min_val || root.val >= max_val

  is_valid(root.left, min_val, root.val) && is_valid(root.right, root.val, max_val)
end
