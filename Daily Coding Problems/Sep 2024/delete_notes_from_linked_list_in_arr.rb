# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {Integer[]} nums
# @param {ListNode} head
# @return {ListNode}
def modified_list(nums, head)
  set = Set.new(nums)
  v_node = ListNode.new(0)
  v_node.next = head
  curr = head
  prev = v_node

  while(!curr.nil?)
    if set.include?(curr.val)
      prev.next = curr.next
      curr = curr.next
    else
      curr = curr.next
      prev = prev.next
    end
  end

  v_node.next
end
