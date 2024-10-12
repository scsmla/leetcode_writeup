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
# @return {Integer}
# Time complexity: O(n)
# Space complexity: O(n)

def max_depth(root)
  return 0 if root.nil?
  return 1 + [max_depth(root.left), max_depth(root.right)].max
end
