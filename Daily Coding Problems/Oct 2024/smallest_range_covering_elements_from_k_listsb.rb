# @param {Integer[][]} nums
# @return {Integer[]}
def smallest_range(nums)
  heap = MinHeap.new
  curr_max = -Float::INFINITY

  # Add all arrays to a heap by their first (smallest) element
  nums.each do |a|
    curr_max = [curr_max, a[0]].max

    # We store an index here with our arrays in the heap so that
    # we can keep track of which element in the array
    # is currently being used at the heap key.

    # heap objects: [list, curr_index]
    heap.push(a[0], [a, 0])
  end

  # pop each array, check for smaller range each time
  range_start = 0
  range_end = Float::INFINITY

  while heap.length == nums.length
    list, list_index = heap.pop
    num = list[list_index]

    if range_end - range_start > curr_max - num
      range_start = num
      range_end = curr_max
    end

    if list_index < list.length - 1
      curr_max = [curr_max, list[list_index+1]].max
      heap.push(list[list_index+1], [list, list_index+1])
    end
  end

  [range_start, range_end]
end
