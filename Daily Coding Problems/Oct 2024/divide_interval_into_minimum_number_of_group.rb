# @param {Integer[][]} intervals
# @return {Integer}
# Time complexity O(nlogn)
# Space complexity O(n)
def min_groups(intervals)
  n = intervals.length
  intervals = intervals.sort
  min_heap = Containers::MinHeap.new

  intervals.each do |left, right|
    if !min_heap.empty? && min_heap.next < left
      min_heap.pop
    end

    min_heap.push(right)
  end

  min_heap.length
end


# @param {Integer[][]} intervals
# @return {Integer}
# Time complexity O(n)
# Space complexity O(n)
def min_groups(intervals)
  times = Array.new(10**6+2, 0)

  for i in 0..intervals.length-1
    left, right = intervals[i]
    times[left] += 1
    times[right+1] -= 1
  end

  ans = 0

  for i in 1..10**6+1
    times[i] += times[i-1]
  end

  times.max
end
