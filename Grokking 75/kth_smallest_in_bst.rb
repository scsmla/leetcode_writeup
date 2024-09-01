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
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
  @count = 0
  @ans = nil
  check(root, k)
  @ans
end

def check(root, k)
  return if root.nil?

  check(root.left, k)
  @count += 1

  if @count == k
    @ans ||= root.val
    return
  end

  check(root.right, k)
end
