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
def max_path_sum(root)
  @max = -10**10
  @max_hash = Hash.new
  dfs(root)
  @max
end

def dfs(root)
  return 0 if root.nil?

  left = [0, dfs(root.left)].max
  right = [0, dfs(root.right)].max
  @max = [@max, root.val + left + right].max

  return root.val + [left, right].max
end
