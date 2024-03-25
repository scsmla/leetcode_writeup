# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  m = s.length
  n = t.length
  count = Hash.new

  for i in 0..n-1
    count[t[i]] = 0 if count[t[i]].nil?
    count[t[i]] += 1
  end

  cnt = 0
  min = 10 ** 5 + 1
  min_l = 0
  l = 0

  for i in 0..m-1
    unless count[s[i]].nil?
      count[s[i]] -= 1
      cnt += 1 if count[s[i]] >= 0
    end

    while(cnt == n)
      if i - l + 1 < min
        min = i - l + 1
        min_l = l
      end

      if !count[s[l]].nil?
        count[s[l]] += 1

        if count[s[l]] > 0
          cnt -= 1
        end
      end

      l += 1
    end
  end

  min < 10 ** 5 + 1 ? s[min_l..min_l+min-1] : ""
end
