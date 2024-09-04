# @param {Integer[]} commands
# @param {Integer[][]} obstacles
# @return {Integer}
def robot_sim(commands, obstacles)
  max = 0
  curr_x, curr_y = 0, 0
  idx = 0
  n = commands.length
  dirs = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  idx_dir = 0
  set = Set.new

  obstacles.each do |obs|
    set << (obs[0].to_s + " " + obs[1].to_s)
  end

  while(idx < n)
    if commands[idx] == -2
      idx_dir = idx_dir == 0 ? 3 : idx_dir - 1
    elsif commands[idx] == -1
      idx_dir = (idx_dir + 1) % 4
    else
      dx, dy = dirs[idx_dir]

      while(commands[idx] > 0 && !set.include?((curr_x + dx).to_s + " " + (curr_y + dy).to_s))
        curr_x += dx
        curr_y += dy
        commands[idx] -= 1
      end
    end

    max = [max, curr_x ** 2 + curr_y ** 2].max
    idx += 1
  end

  max
end
