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
# @param {Integer} n
# @param {Integer} x
# @return {Boolean}
# Link: https://leetcode.com/problems/binary-tree-coloring-game/description/
def btree_game_winning_move(root, n, x)
  @child_x = 0
  @target_x = nil
  dfs(root, x)

  if root.val == x
    child_left = count_child(root.left)
    child_right = count_child(root.right)

    return false if (child_left - child_right).abs <= 1
    return true
  end

  return true if count_child(@target_x.left) > n/2 || count_child(@target_x.right) > n/2
  return false if @child_x > n/2

  true
end

def dfs(root, x)
  return if root.nil?

  if root.val == x
    @target_x = root
    @child_x = count_child(root)
    return
  end

  dfs(root.left, x)
  dfs(root.right, x)
end

def count_child(x)
  return 0 if x.nil?
  return 1 if x.left.nil? && x.right.nil?

  curr = 1
  curr += count_child(x.left)
  curr += count_child(x.right)

  return curr
end
