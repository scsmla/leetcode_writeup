# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, v1, v2)
  return nil if root.nil?

  if check(root.left, v1) && check(root.left, v2)
    return lowest_common_ancestor(root.left, v1, v2)
  end

  if check(root.right, v1) && check(root.right, v2)
    return lowest_common_ancestor(root.right, v1, v2)
  end

  return root
end

def check(root, target)
  return false if root.nil?
  return root == target || check(root.left, target) || check(root.right, target)
end
