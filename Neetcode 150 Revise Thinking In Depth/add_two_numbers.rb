# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
# Time complexity: O(n)
# Space complexity: O(1)
def add_two_numbers(l1, l2)
  v_node = ListNode.new(0)
  carry = 0
  c_node = v_node

  while(!l1.nil? || !l2.nil? || carry != 0)
    first = l1.nil? ? 0 : l1.val
    second = l2.nil? ? 0 : l2.val
    curr = first + second + carry
    carry = curr / 10
    temp = ListNode.new(curr % 10)
    c_node.next = temp
    c_node = temp
    l1 = l1.next if !l1.nil?
    l2 = l2.next if !l2.nil?
  end

  v_node.next
end
