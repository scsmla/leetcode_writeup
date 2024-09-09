# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {Integer} m
# @param {Integer} n
# @param {ListNode} head
# @return {Integer[][]}
def spiral_matrix(m, n, head)
  res = Array.new(m){Array.new(n, -1)}
  dirs = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  idx_dir = 0
  curr_x, curr_y = 0, 0
  curr = head

  while(!curr.nil?)
    val = curr.val
    res[curr_x][curr_y] = val
    dx, dy = dirs[idx_dir]

    if curr_x + dx < 0 || curr_y + dy < 0 || curr_x + dx >= m || curr_y + dy >= n || res[curr_x+dx][curr_y+dy] >= 0
      idx_dir = (idx_dir+1) % 4
    end

    dx, dy = dirs[idx_dir]
    curr_x += dx
    curr_y += dy
    curr = curr.next
  end

  res
end
