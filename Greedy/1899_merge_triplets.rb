# @param {Integer[][]} triplets
# @param {Integer[]} target
# @return {Boolean}
# Link: https://leetcode.com/problems/merge-triplets-to-form-target-triplet/description/
def merge_triplets(triplets, target)
  res = [0, 0, 0]

  for i in 0..triplets.length-1
    x, y, z = triplets[i]
    if x <= target[0] && y <= target[1] && z <= target[2]
      res = [[x, res[0]].max, [y, res[1]].max, [z, res[2]].max]
    end
  end

  res == target
end
