# @param {Integer[][]} rectangles
# @param {Integer[][]} points
# @return {Integer[]}
# Link: https://leetcode.com/problems/count-number-of-rectangles-containing-each-point/description/
def count_rectangles(rectangles, points)
  l_h = Array.new(101){Array.new}
  for i in 0..rectangles.length-1
    l, h = rectangles[i]
    l_h[h].push(l)
  end

  for i in 1..100
    l_h[i].sort!
  end

  res = []
  points.each do |point|
    x, y = point
    curr = 0
    for j in y..100
      idx = l_h[j].bsearch_index{|m| m >= x}
      curr += l_h[j].length - idx if !idx.nil?
    end

    res.push(curr)
  end

  res
end
