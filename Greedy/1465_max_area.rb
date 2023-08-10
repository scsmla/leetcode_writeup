# @param {Integer} h
# @param {Integer} w
# @param {Integer[]} horizontal_cuts
# @param {Integer[]} vertical_cuts
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-area-of-a-piece-of-cake-after-horizontal-and-vertical-cuts/
def max_area(h, w, horizontal_cuts, vertical_cuts)
  horizontal_cuts = horizontal_cuts.sort
  vertical_cuts = vertical_cuts.sort
  max_h = 0
  max_w = 0
  prev = 0

  for i in 0..horizontal_cuts.length-1
    max_h = [max_h, horizontal_cuts[i] - prev].max
    prev = horizontal_cuts[i]
  end

  max_h = [h - prev, max_h].max

  prev = 0

  for i in 0..vertical_cuts.length-1
    max_w = [max_w, vertical_cuts[i] - prev].max
    prev = vertical_cuts[i]
  end

  max_w = [w-prev, max_w].max

  (max_h * max_w) % (10**9+7)
end
