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

# Time complexity: O(n)
# Space complexity: O(1)
def reverse_list(head)
  new_head = nil

  while(!head.nil?)
    temp = head.next
    head.next = new_head
    new_head = head
    head = temp
  end

  new_head
end
