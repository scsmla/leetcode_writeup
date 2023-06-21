# @param {Integer} n
# @return {Integer}
# Link: https://leetcode.com/problems/count-number-of-ways-to-place-houses/description/
def count_house_placements(n)
  t = 2
  h = 1
  s = 1
  mod = 10**9 + 7
  for i in 2..n
    h = s
    s = t
    t = (s+h) % mod
  end

  t*t % mod
end
