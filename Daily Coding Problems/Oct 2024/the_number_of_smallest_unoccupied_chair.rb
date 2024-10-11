# @param {Integer[][]} times
# @param {Integer} target_friend
# @return {Integer}
def smallest_chair(times, target_friend)
  arrival_leave = Hash.new

  for i in 0..times.length-1
    arrival_leave[times[i][0]] = times[i][1]
  end

  leave = Hash.new
  min_chair = Containers::MinHeap.new

  for i in 0..times.length-1
    min_chair.push(i)
  end
  next_greater = 0

  for i in 0..10**5
    if !leave[i].nil?
      leave[i].each do |num|
        min_chair.push(num)
      end
    end

    if arrival_leave[i].to_i > 0
      curr = min_chair.pop
      leave[arrival_leave[i].to_i] ||= []
      leave[arrival_leave[i].to_i] << curr
      return curr if i == times[target_friend][0]
    end
  end
end
