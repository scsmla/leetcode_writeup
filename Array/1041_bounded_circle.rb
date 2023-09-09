# @param {String} instructions
# @return {Boolean}
# Link: https://leetcode.com/problems/robot-bounded-in-circle/description/

def is_robot_bounded(instructions)
  sim = instructions * 4
  visited = Hash.new
  curr = [0, 0]
  visited[curr] = 1
  dirs = [[0, 1], [-1, 0], [0, -1], [1, 0]]
  j = 0

  for i in 0..sim.length-1
    if sim[i] == 'G'
      curr[0] = curr[0] + dirs[j][0]
      curr[1] = curr[1] + dirs[j][1]
    elsif sim[i] == 'L'
      j = (j+1) % 4
    else
      if j == 0
        j = 3
      else
        j -= 1
      end
    end
  end

  return true if !visited[curr].nil?

  false
end
