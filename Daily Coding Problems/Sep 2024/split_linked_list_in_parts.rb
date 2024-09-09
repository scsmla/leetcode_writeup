# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} k
# @return {ListNode[]}
def split_list_to_parts(head, k)
  res = []
  count = 0
  curr = head

  while(!curr.nil?)
    count += 1
    curr = curr.next
  end

  parts = Array.new(k, 0)
  mod = count % k

  for i in 0..k-1
    parts[i] = count / k
    parts[i] += 1 if mod > 0
    mod -= 1
  end

  idx = 0
  curr = head
  count = 1
  prev = head

  while(!curr.nil?)
    if count >= parts[idx]
      res << prev
      temp = curr.next
      curr.next = nil
      count = 1
      curr = temp
      prev = temp
      idx += 1
    else
      curr = curr.next
      count += 1
    end
  end

  need = k - res.length

  while(need > 0)
    res << []
    need -= 1
  end

  res
end
