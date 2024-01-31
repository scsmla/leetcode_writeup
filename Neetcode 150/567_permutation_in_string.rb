# @param {String} s1
# @param {String} s2
# @return {Boolean}
# Link: https://leetcode.com/problems/permutation-in-string/description/
def check_inclusion(s1, s2)
  m, n = s1.length, s2.length
  return false if m > n

  count_s1 = Array.new(26, 0)
  count_curr = Array.new(26, 0)

  for i in 0..s1.length-1
    count_s1[s1[i].ord-97] += 1
  end

  for j in 0..m-1
    count_curr[s2[j].ord-97] += 1
  end

  for j in 0..25
    break if count_curr[j] != count_s1[j]
  end

  return true if j == 25 && count_curr[-1] == count_s1[-1]

  for i in 1..n-m
    count_curr[s2[i-1].ord-97] -= 1
    count_curr[s2[i+m-1].ord-97] += 1

    for j in 0..25
      break if count_curr[j] != count_s1[j]
    end

    return true if j == 25 && count_curr[-1] == count_s1[-1]
  end

  false
end
