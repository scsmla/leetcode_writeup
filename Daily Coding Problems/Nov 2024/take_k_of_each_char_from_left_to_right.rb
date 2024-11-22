# @param {String} s
# @param {Integer} k
# @return {Integer}
def take_characters(s, k)
  n = s.length
  return -1 if s.count('a') < k || s.count('b') < k || s.count('c') < k

  limit = s.chars.tally
  limit['a'] ||= 0
  limit['b'] ||= 0
  limit['c'] ||= 0
  limit = limit.update(limit) {|_ ,v| v -= k}
  cnt = Hash.new
  j = 0
  ans = n

  for i in 0..n-1
    cnt[s[i]] ||= 0
    cnt[s[i]] += 1
    while(cnt[s[i]] > limit[s[i]] && j <= i)
      cnt[s[j]] -= 1
      j += 1
    end

    ans = [ans, n-(i-j+1)].min
  end

  ans
end
