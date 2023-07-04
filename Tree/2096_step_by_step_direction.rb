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
# @param {Integer} start_value
# @param {Integer} dest_value
# @return {String}
# Link: https://leetcode.com/problems/step-by-step-directions-from-a-binary-tree-node-to-another/description/
def get_directions(root, start_value, dest_value)
  s_p = []
  d_p = []
  dfs(root, start_value, s_p)
  dfs(root, dest_value, d_p)

  while(!s_p.empty? && !d_p.empty? && s_p[-1] == d_p[-1])
    s_p.pop
    d_p.pop
  end

  'U'*s_p.length + d_p.join('').reverse
end

def dfs(node, val, path)
  if node.val == val
    return true
  elsif !node.left.nil? && dfs(node.left, val, path)
    path.push('L')
  elsif !node.right.nil? && dfs(node.right, val, path)
    path.push('R')
  end

  return !path.empty?
end
