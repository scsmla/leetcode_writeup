# @param {Integer} x
# @param {Integer} y
# @param {Integer} bound
# @return {Integer[]}
# Link: https://leetcode.com/problems/powerful-integers/
def powerful_integers(x, y, bound)
  a = []
  b = []
  x1, y1 = 0, 0

  while(x**x1 < bound)
    a << x ** x1
    x1 += 1
    break if x**x1 == 1
  end

  while(y**y1 < bound)
    b << y ** y1
    y1 += 1

    break if y**x1 == 1
  end
  res = []
  for i in 0..a.length-1
    for j in 0..b.length-1
      res << a[i] + b[j] if a[i] + b[j] <= bound
    end
  end

  res.uniq
end
