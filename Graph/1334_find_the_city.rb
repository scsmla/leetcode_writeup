# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} distance_threshold
# @return {Integer}
# Link: https://leetcode.com/problems/find-the-city-with-the-smallest-number-of-neighbors-at-a-threshold-distance/
def find_the_city(n, edges, distance_threshold)
  max_distance = 10**9
  matrix = Array.new(n){Array.new(n, max_distance)}

  for i in 0..edges.length-1
    x, y, distance = edges[i]
    matrix[x][y] = distance
    matrix[y][x] = distance
  end

  for i in 0..n-1
    matrix[i][i] = 0
  end

  for i in 0..n-1
    for j in 0..n-1
      for q in 0..n-1
        matrix[j][q] = [matrix[j][q], matrix[j][i] + matrix[i][q]].min
      end
    end
  end

  min = n
  res = 0
  for i in 0..n-1
    curr = 0
    for j in 0..n-1
      next if i == j
      curr += 1 if matrix[i][j] <= distance_threshold
    end

    if curr <= min
      res = i
      min = curr
    end
  end

  res
end
