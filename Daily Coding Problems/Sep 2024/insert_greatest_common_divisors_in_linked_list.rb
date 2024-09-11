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
def insert_greatest_common_divisors(head)
  curr = head

  while(!curr.nil? && !curr.next.nil?)
    gcd_val = curr.val.gcd(curr.next.val)
    new_node = ListNode.new(gcd_val)
    temp = curr.next
    curr.next = new_node
    new_node.next = temp
    curr = temp
  end

  head
end
