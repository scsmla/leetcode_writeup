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
# @return {TreeNode}
# Time complexity: O(n)
# Space complexity: O(n)
def invert_tree(root)
  return nil if root.nil?

  right_root = root.right
  left_root = root.left
  root.left = invert_tree(right_root)
  root.right = invert_tree(left_root)

  root
end
