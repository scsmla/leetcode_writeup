# @param {Integer} target
# @param {Integer} max_doubles
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-moves-to-reach-target-score/description/
def min_moves(target, max_doubles)
  return 0 if target == 1
  cnt = 0

  while(target > 1)
    if max_doubles > 0
      if target % 2 == 1
        target -= 1
      else
        target /= 2
        max_doubles -= 1
      end

      cnt += 1
    else
      cnt += target-1
      target -= target-1
    end
  end

  cnt
end
