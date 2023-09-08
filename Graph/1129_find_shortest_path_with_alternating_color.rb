# @param {Integer} n
# @param {Integer[][]} red_edges
# @param {Integer[][]} blue_edges
# @return {Integer[]}
def shortest_alternating_paths(n, red_edges, blue_edges)
  @red = Array.new(n){Array.new}
  @blue = Array.new(n){Array.new}

  for i in 0..red_edges.length-1
    inc, out = red_edges[i]
    @red[inc] << out
  end

  for i in 0..blue_edges.length-1
    inc, out = blue_edges[i]
    @blue[inc] << out
  end

  ans = Array.new(n, 0)

  for target in 0..n-1
    found_b = cal_path(target, n, 'B')
    found_r = cal_path(target, n, 'R')

    if found_b == -1 || found_r == -1
      ans[target] = found_b * found_r * -1
    else
      ans[target] = [found_b, found_r].min
    end
  end

  ans
end

def cal_path(target, n, curr_color)
  queue = [0]
  curr = curr_color
  red_visited = Array.new(n, 0)
  blue_visited = Array.new(n, 0)

  if curr == 'B'
    blue_visited[0] = 1
  else
    red_visited[0] = 1
  end
  cnt = 0

  while(!queue.empty?)
    l = queue.length

    for j in 0..queue.length-1
      top = queue.shift

      return cnt if top == target

      if curr == 'B'
        for i in 0..@blue[top].length-1
          next if red_visited[@blue[top][i]] >= 1
          red_visited[@blue[top][i]] += 1
          queue.push(@blue[top][i])
        end
      else
        for i in 0..@red[top].length-1
          next if blue_visited[@red[top][i]] >= 1
          blue_visited[@red[top][i]] += 1
          queue.push(@red[top][i])
        end
      end
    end

    cnt += 1
    curr = curr == 'B' ? 'R' : 'B'
  end

  return -1
end
