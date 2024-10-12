# @param {Integer[]} stones
# @return {Integer}
#---------------------------------------------------------
# Time complexity: O(n)
# Space complexity: O(n)
def last_stone_weight(stones)
  pq = Containers::MaxHeap.new

  for i in 0..stones.length-1
    pq.push(stones[i])
  end

  while(pq.size >= 0)
    return 0 if pq.size == 0
    return pq.pop if pq.size == 1

    x = pq.pop
    y = pq.pop
    if x != y
      pq.push((x-y).abs)
    end
  end
end
