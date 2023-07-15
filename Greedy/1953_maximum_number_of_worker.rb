# @param {Integer[]} milestones
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-number-of-weeks-for-which-you-can-work/description/
def number_of_weeks(milestones)
  max = milestones.max
  sum = milestones.sum
  remain = sum-max
  if max > remain
    return remain + remain + 1
  else
    return sum
  end
end
