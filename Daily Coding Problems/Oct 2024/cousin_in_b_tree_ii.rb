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
# @return {TreeNode}
def replace_value_in_tree(root)
  queue = [root]
  while(!queue.empty?)
    l = queue.length
    next_gen_sum = 0

    for i in 0..l-1
      next_gen_sum += queue[i].left&.val.to_i
      next_gen_sum += queue[i].right&.val.to_i
    end

    for i in 0..l-1
      curr = queue.shift
      next if curr.nil?
      child_sum = curr.left&.val.to_i + curr.right&.val.to_i
      if !curr.left.nil?
        curr.left.val = next_gen_sum - child_sum
        queue.push(curr.left)
      end

      if !curr.right.nil?
        curr.right.val = next_gen_sum - child_sum
        queue.push(curr.right)
      end
    end
  end

  root.val = 0
  root
end
