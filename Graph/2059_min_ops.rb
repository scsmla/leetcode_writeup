# @param {Integer[]} nums
# @param {Integer} start
# @param {Integer} goal
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-operations-to-convert-number/description/
def minimum_operations(nums, start, goal)
  visited = Hash.new
  queue = [start]
  curr = 0

  while(!queue.empty?)
    l = queue.length

    for i in 0..l-1
      top = queue.shift
      return curr if top == goal
      next if top < 0 || top > 1000 || visited[top].to_i == 1

      visited[top] = 1
      for j in 0..nums.length-1
        a = top + nums[j]
        b = top - nums[j]
        c = top ^ nums[j]
        queue.concat([a, b, c])
      end
    end

    curr += 1
  end

  return -1
end
