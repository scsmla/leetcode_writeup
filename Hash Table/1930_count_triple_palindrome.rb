# @param {String} s
# @return {Integer}
# Link: https://leetcode.com/problems/unique-length-3-palindromic-subsequences/
def count_palindromic_subsequence(s)
  n = s.length
  count = Array.new(26){Array.new(n, 0)}
  a = Hash.new

  for i in 0..n-1
    c_c = s[i].ord-97
    a[c_c] = [] if a[c_c].nil?
    a[c_c] << i

    for j in 0..25
      if j != c_c
        count[j][i] = count[j][i-1] if i > 0
      else
        if i > 0
          count[j][i] = count[j][i-1] + 1
        else
          count[j][i] = 1
        end
      end
    end
  end

  res = 0

  for i in 0..25
    next if a[i].nil? || a[i].length <= 1

    f, l = a[i][0], a[i][-1]
    next if l-f == 1
    for j in 0..25
      if j != i
        res += 1 if count[j][l] - count[j][f] >= 1
      else
        res += 1 if count[j][l] - count[j][f] >= 2
      end
    end
  end

  res
end
