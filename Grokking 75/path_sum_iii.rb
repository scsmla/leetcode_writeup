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
# @param {Integer} target_sum
# @return {Integer}
def path_sum(root, target_sum)
  @curr = 0
  @target = target_sum
  dfs(root)
  @curr
end

def dfs(root)
  return if root.nil?

  check(root, 0)
  dfs(root.left)
  dfs(root.right)
end

def check(root, sum)
  return if root.nil?
  sum += root.val
  @curr += 1 if sum == @target

  check(root.left, sum)
  check(root.right, sum)
end
