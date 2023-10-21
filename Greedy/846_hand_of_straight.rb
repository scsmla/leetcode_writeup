# Link: https://leetcode.com/problems/hand-of-straights/

# @param {Integer[]} hand
# @param {Integer} group_size
# @return {Boolean}
def is_n_straight_hand(hand, group_size)
  a = Hash.new

  for i in 0..hand.length-1
    a[hand[i]] = 0 if a[hand[i]].nil?
    a[hand[i]] += 1
  end

  all_keys = a.keys.sort

  all_keys.each do |key|
    next if a[key].to_i == 0
    first = a[key]

    for j in 0..group_size-1
      return false if a[j+key].to_i < first
      a[j+key] -= first
    end
  end

  true
end
