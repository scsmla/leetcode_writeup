# @param {Integer} bottom
# @param {Integer} top
# @param {Integer[]} special
# @return {Integer}
#Link: https://leetcode.com/problems/maximum-consecutive-floors-without-special-floors/description/
def max_consecutive(bottom, top, special)
  max = 0
  special = special.sort
  for i in 0..special.length-1
    space =
      if i == 0
        special[i] - bottom
      else
        special[i] - special[i-1] - 1
      end

    max = [max, space].max
  end

  max = [max, top - special[-1]].max


  max
end
