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
#Link: https://leetcode.com/problems/maximum-product-of-splitted-binary-tree/description/
def max_product(root)
  @node_sum = Hash.new
  dfs(root)
  @max = 0
  @total = @node_sum[root]
  check(root.left)
  check(root.right)
  @max % (10**9+7)
end

def dfs(root)
  return 0 if root.nil?
  return @node_sum[root] if !@node_sum[root].nil?

  @node_sum[root] = root.val + dfs(root.left) + dfs(root.right)
end

def check(root)
  return if root.nil?
  @max = [@node_sum[root] * (@total - @node_sum[root]), @max].max
  check(root.left)
  check(root.right)
end
