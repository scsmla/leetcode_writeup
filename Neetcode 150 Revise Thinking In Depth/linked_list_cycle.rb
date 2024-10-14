# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = va
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}

# Time complexity: O(n)
# Space complexity: O(1)
def hasCycle(head)
  return false if head.nil?

  fast = head
  slow = head

  while(!fast.nil? && !fast.next.nil?)
    fast = fast.next.next
    slow = slow.next
    return true if fast == slow
  end

  return false
end
