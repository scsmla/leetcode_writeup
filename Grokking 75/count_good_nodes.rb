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
def good_nodes(root)
  @curr = 0
  dfs(root, [])
  @curr
end

def dfs(root, path)
  return if root.nil?

  path << root.val
  @curr += 1 if path.max <= root.val
  dfs(root.left, path.dup)
  dfs(root.right, path.dup)
end
