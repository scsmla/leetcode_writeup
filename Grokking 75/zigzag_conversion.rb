# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return s if num_rows == 1

  matrix = Array.new(num_rows){Array.new(1000, '')}
  idx = 0
  dirs = [[1, 0], [-1, 1]]
  idx_dir = 0
  curr_x, curr_y = 0, 0

  while(idx <= s.length-1)

    matrix[curr_x][curr_y] = s[idx]
    idx += 1

    dx = dirs[idx_dir][0]
    dy = dirs[idx_dir][1]

    curr_x = curr_x + dx
    curr_y = curr_y + dy

    if curr_x == num_rows-1
      idx_dir = 1
    end

    if curr_x == 0
      idx_dir = 0
    end
  end

  matrix.map{|x| x.join('')}.join('')
end
