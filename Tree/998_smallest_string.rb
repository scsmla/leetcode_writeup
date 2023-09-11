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
# @return {String}
# Link: https://leetcode.com/problems/smallest-string-starting-from-leaf/description/
def smallest_from_leaf(root)
  return (root.val+97).chr if root.left.nil? && root.right.nil?

  @curr = []
  dfs(root, [])

  @curr.sort[0].map{|x| (x+97).chr}.join('')
end

def dfs(root, path)
  if root.nil?
    return
  end

  if root.left.nil? && root.right.nil?
    path << root.val
    @curr << path.reverse
    return
  end

  path << root.val

  dfs(root.left, path.dup)
  dfs(root.right, path.dup)
end
