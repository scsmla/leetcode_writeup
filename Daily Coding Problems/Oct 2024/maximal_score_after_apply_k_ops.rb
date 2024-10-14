# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_kelements(nums, k)
  n = nums.length
  max_heap = MaxHeap.new

  nums.each do |num|
    max_heap.push(num)
  end

  curr = 0
  while(k > 0)
    nex = max_heap.pop
    curr += nex
    max_heap.push((nex.to_f/3).ceil)
    k -= 1
  end

  curr
end
