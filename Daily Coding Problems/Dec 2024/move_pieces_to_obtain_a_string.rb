# @param {String} start
# @param {String} target
# @return {Boolean}
def can_change(start, target)
  return false if start.count('L') != target.count('L') || start.count('R') != target.count('R')
  return false if start.length != target.length

  count_l_s, count_r_s = 0, 0
  count_l_t, count_r_t = 0, 0

  for i in 0..start.length-1
    count_l_s += 1 if start[i] == 'L'
    count_r_s += 1 if start[i] == 'R'
    count_l_t += 1 if target[i] == 'L'
    count_r_t += 1 if target[i] == 'R'

    return false if count_l_s > count_l_t
    return false if count_r_s < count_r_t
  end

  temp1 = ""
  temp2 = ""

  for i in 0..start.length-1
    temp1 += start[i] if start[i] != '_'
    temp2 += target[i] if target[i] != '_'
  end

  return false if temp1 != temp2

  true
end
