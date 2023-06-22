# @param {Integer[]} spells
# @param {Integer[]} potions
# @param {Integer} success
# @return {Integer[]}
# Link: https://leetcode.com/problems/successful-pairs-of-spells-and-potions/description/
def successful_pairs(spells, potions, success)
  n, m = spells.length, potions.length
  potions = potions.sort
  res = Array.new(n, 0)
  for i in 0..n-1
    target = success.to_f/spells[i]
    p_idx = potions.bsearch_index{|x| x >= target}
    res[i] =
      if p_idx.nil?
        0
      else
        m - p_idx
      end
  end

  res
end
