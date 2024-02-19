# @param {Integer} target
# @param {Integer[]} position
# @param {Integer[]} speed
# @return {Integer}
def car_fleet(target, position, speed)
  n = position.length
  pos_to_target = Array.new(n){Array.new(2)}

  for i in 0..n-1
    pos_to_target[i] = [position[i], (target-position[i]).to_f/speed[i]]
  end

  pos_to_target = pos_to_target.sort_by{|x| x[0]}.reverse
  count = 0
  curr = 0

  for i in 0..n-1
    if pos_to_target[i][1] > curr
      curr = pos_to_target[i][1]
      count += 1
    end
  end

  count
end
