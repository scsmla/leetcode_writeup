# @param {Integer[][]} properties
# @return {Integer}
# Link: https://leetcode.com/problems/the-number-of-weak-characters-in-the-game/description/
def number_of_weak_characters(properties)
  ans = 0
  properties = properties.sort_by{|x| [x[0], -x[1]]}
  n = properties.length
  max = -1
  for i in (n-1).downto(0)
    ans += 1 if properties[i][1] < max
    max = [max, properties[i][1]].max
  end

  ans
end
