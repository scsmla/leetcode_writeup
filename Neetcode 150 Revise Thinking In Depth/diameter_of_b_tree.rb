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

#---------------------------------------------------------
# Time complexity: O(n)
# Space complexity: O(n)
def diameter_of_binary_tree(root)
  @max = 0
  @height_memo = Hash.new
  dfs(root)
  @max
end

def dfs(root)
  return if root.nil?

  @max = [@max, height(root.left) + height(root.right)].max
  dfs(root.left)
  dfs(root.right)
end

def height(root)
  return 0 if root.nil?
  return @height_memo[root] if !@height_memo[root].nil?

  @height_memo[root] =  1 + [height(root.left), height(root.right)].max
end
#---------------------------------------------------------
