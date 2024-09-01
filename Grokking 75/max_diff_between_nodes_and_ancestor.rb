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
def max_ancestor_diff(root)
  @max = 0
  dfs(root)
  @max
end

def dfs(root)
  return if root.nil?

  check(root, root)
  dfs(root.left)
  dfs(root.right)
end

def check(ancestor, curr)
  return if curr.nil?

  @max = [@max, (ancestor.val - curr.val).abs].max
  check(ancestor, curr.left)
  check(ancestor, curr.right)
end
