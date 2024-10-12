# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
#---------------------------------------------------------
# Time complexity: O(n)
# Space complexity: O(logn)
def is_same_tree(tree1, tree2)
  return true if tree1.nil? && tree2.nil?
  return false if tree1&.val != tree2&.val

  is_same_tree(tree1.left, tree2.left) && is_same_tree(tree1.right, tree2.right)
end
