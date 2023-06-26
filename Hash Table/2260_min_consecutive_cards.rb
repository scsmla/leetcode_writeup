# @param {Integer[]} cards
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-consecutive-cards-to-pick-up/description/
def minimum_card_pickup(cards)
  min = 10**6
  n = cards.length
  a = Hash.new
  for i in 0..n-1
    if a[cards[i]].nil?
      a[cards[i]] = i
    else
      min = [min, i-a[cards[i]] + 1].min
      a[cards[i]] = i
    end
  end

  min == 10 ** 6 ? -1 : min
end
