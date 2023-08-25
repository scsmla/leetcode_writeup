# @param {String} s
# @return {Integer}
# Link: https://leetcode.com/problems/replace-the-substring-for-balanced-string/
def balanced_string(s)
  a = Hash.new
  n = s.length
  'QWER'.chars.each do |c|
    a[c] = 0
  end

  for i in 0..n-1
    a[s[i]] += 1
  end

  res = n
  j = 0

  for i in 0..n-1
    a[s[i]] -= 1

    while(j < n && a['Q'] <= n/4 && a['W'] <= n/4 && a['R'] <= n/4 && a['E'] <= n/4)
      res = [res, i-j+1].min
      a[s[j]] += 1
      j += 1
    end
  end

  res
end
