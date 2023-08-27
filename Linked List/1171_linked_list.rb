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
# Link: https://leetcode.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list/description/
def remove_zero_sum_sublists(head)
  p_head = ListNode.new(0)
  p_head.next = head
  po = p_head
  sum_map = Hash.new
  curr = 0

  while(po != nil)
    curr += po.val
    sum_map[curr] = po
    po = po.next
  end

  po = p_head
  curr = 0

  while(po != nil)
    curr += po.val
    po.next = sum_map[curr].next
    po = po.next
  end

  p_head.next
end
