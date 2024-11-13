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
# Space complexity: O(logn)
def good_nodes(root)
  @res = 0
  dfs(root, -10**5)
  @res
end

def dfs(root, curr_max)
  return if root.nil?

  @res += 1 if curr_max <= root.val
  dfs(root.left, [root.val, curr_max].max)
  dfs(root.right, [root.val, curr_max].max)
end
