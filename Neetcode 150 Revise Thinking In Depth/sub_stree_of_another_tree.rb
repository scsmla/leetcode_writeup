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
# @param {TreeNode} sub_root
# @return {Boolean}
#---------------------------------------------------------
# Time complexity: O(m*n)
# Space complexity: O(m*n)
# def is_subtree(root, sub_root)
#   @exist = false
#   dfs(root, sub_root)
#   @exist
# end

# def dfs(root, sub_root)
#   return if root.nil? || @exist

#   @exist = check(root, sub_root) || @exist
#   dfs(root.left, sub_root)
#   dfs(root.right, sub_root)
# end

# def check(root, sub_root)
#   return true if sub_root.nil? && root.nil?
#   return false if root&.val != sub_root&.val
#   return check(root.left, sub_root.left) && check(root.right, sub_root.right)
# end
#---------------------------------------------------------
# Merkle tree

#---------------------------------------------------------
# Time complexity: O(m+n)
# Space complexity: O(m+n)

require 'digest'

class TreeNode
  attr_accessor :val, :left, :right, :merkle

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
    @merkle = nil
  end
end

def is_subtree(s, t)
  def hash_(x)
    Digest::SHA256.hexdigest(x)
  end

  def merkle(node)
    return '#' if node.nil?

    m_left = merkle(node.left)
    m_right = merkle(node.right)

    node.merkle = hash_(m_left + node.val.to_s + m_right)

    return node.merkle
  end

  merkle(s)
  merkle(t)

  def dfs(node, t)
    return false if node.nil?

    node.merkle == t.merkle || dfs(node.left, t) || dfs(node.right, t)
  end

  dfs(s, t)
end
