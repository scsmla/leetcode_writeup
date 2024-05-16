# @param {Integer[][]} points
# @param {String} s
# @return {Integer}
def max_points_inside_square(points, s)
  n = points.length
  belong_to_square = Array.new(n, 0)

  left = 0
  right = 10 ** 10
  @max = 0

  while(left < right)
    mid = (left+right)/2

    if valid(mid, points, s)
      left = mid+1
    else
      right = mid
    end
  end

  @max
end

def valid(mid, points, s)
  a = Hash.new
  count = 0

  for i in 0..points.length-1
    belong_to_square = [points[i][0].abs, points[i][1].abs].max
    next if belong_to_square > mid
    return false unless a[s[i]].nil?

    a[s[i]] = points[i]
    count += 1
  end

  @max = [@max, count].max
  true
end
