# @param {Integer[][]} rectangles
# @return {Integer}
# Link: https://leetcode.com/problems/number-of-pairs-of-interchangeable-rectangles/description/
def interchangeable_rectangles(rectangles)
  a = Hash.new
  for i in 0..rectangles.length-1
    w, h = rectangles[i]
    t = w.to_f/h
    a[t] = 0 if a[t].nil?
    a[t] += 1
  end

  res = 0
  a.each do |_, v|
    res += v*(v-1)/2
  end


  res
end
