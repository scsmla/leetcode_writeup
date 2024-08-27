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
def diameter_of_binary_tree(root)
  @max = 0
  @height = Hash.new
  dfs(root)
  @max
end

def height(root)
  return @height[root] if !@height[root].nil?
  return 0 if root.nil?
  @height[root] = 1 + [height(root.left), height(root.right)].max

  return @height[root]
end

def dfs(root)
  return if root.nil?
  @max = [@max, height(root.left) + height(root.right)].max

  dfs(root.left)
  dfs(root.right)
end
