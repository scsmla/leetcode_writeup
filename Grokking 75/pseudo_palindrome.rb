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
def pseudo_palindromic_paths (root)
  @curr = 0
  dfs(root, Hash.new)
  @curr
end

def dfs(root, hash)
  hash[root.val] ||= 0
  hash[root.val] += 1

  if root.left.nil? && root.right.nil?
    @curr += 1 if can_valid_palindrome(hash)
    return
  end

  dfs(root.left, hash.dup) if !root.left.nil?
  dfs(root.right, hash.dup) if !root.right.nil?
end

def can_valid_palindrome(hash)
  count_odd = 0

  for i in 1..9
    count_odd += 1 if hash[i].to_i % 2 == 1
    return false if count_odd > 1
  end

  true
end
