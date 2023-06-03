# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} k
# @return {Integer}

# Link: https://leetcode.com/problems/kth-largest-sum-in-a-binary-tree/
def kth_largest_level_sum(root, k)
  sums = []
  queue = [root]

  while(!queue.empty?)
      l = queue.length
      curr = 0
      for i in 0..l-1
          top = queue.shift
          next if top.nil?
          curr += top.val
          queue.push(top.right) if top.right
          queue.push(top.left) if top.left
      end
      sums.push(curr)
  end

  sums.length < k ? -1 : sums.sort.reverse[k-1]
end
