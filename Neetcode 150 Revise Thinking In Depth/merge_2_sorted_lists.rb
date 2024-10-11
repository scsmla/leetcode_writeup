# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
#---------------------------------------------------------
# Time complexity: O(n)
# Space complexity: O(1)
def merge_two_lists(list1, list2)
  temp = ListNode.new(0)
  curr = temp

  while(list1 && list2)
    if list1.val > list2.val
      curr.next = list2
      list2 = list2.next
    else
      curr.next = list1
      list1 = list1.next
    end

    curr = curr.next
  end

  while(list1)
    curr.next = list1
    curr = curr.next
    list1 = list1.next
  end

  while(list2)
    curr.next = list2
    curr = curr.next
    list2 = list2.next
  end

  temp.next
end
#---------------------------------------------------------
