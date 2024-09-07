# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {ListNode} head
# @param {TreeNode} root
# @return {Boolean}
def is_sub_path(head, root)
  @found = false
  dfs(root, head)

  @found
end

def dfs(root, head)
  return if root.nil?

  check(root, head)
  unless @found
    dfs(root.left, head)
    dfs(root.right, head)
  end
end

def check(root, head)
  if head.nil?
    @found = true
    return
  end

  return if root.nil?
  return if root.val != head.val

  check(root.left, head.next)
  check(root.right, head.next)
end
