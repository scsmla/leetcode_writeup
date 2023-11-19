# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
# Link: https://leetcode.com/problems/insert-greatest-common-divisors-in-linked-list/description/
def insert_greatest_common_divisors(head)
  curr = head
  while(!curr.next.nil?)
    new_node = ListNode.new(curr.val.gcd(curr.next.val))
    new_node.next = curr.next
    curr.next = new_node
    curr = new_node.next
  end

  head
end
