# @param {Integer[]} tops
# @param {Integer[]} bottoms
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-domino-rotations-for-equal-row/description/
def min_domino_rotations(tops, bottoms)
  n = tops.length
  min = n+1
  [1, 2, 3, 4, 5, 6].each do |target|
    cnt = 0
    im = false

    for i in 0..n-1
      next if tops[i] == target
      cnt += 1 if bottoms[i] == target
      if bottoms[i] != target
        im = true
        break
      end
    end

    if !im
      min = [min, cnt].min
    end
  end

  [1, 2, 3, 4, 5, 6].each do |target|
    cnt = 0
    im = false

    for i in 0..n-1
      next if bottoms[i] == target
      cnt += 1 if tops[i] == target
      if tops[i] != target
        im = true
        break
      end
    end

    if !im
      min = [min, cnt].min
    end
  end

  min == n + 1 ? -1 : min
end
