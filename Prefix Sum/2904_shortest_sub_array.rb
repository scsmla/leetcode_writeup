# @param {String} s
# @param {Integer} k
# @return {String}
# Link: https://leetcode.com/problems/shortest-and-lexicographically-smallest-beautiful-string/
def shortest_beautiful_substring(s, k)
  n = s.length
  cnt = Array.new(n+1, 0)
  curr = 0

  for i in 0..n-1
    curr += 1 if s[i] == '1'
    cnt[i+1] = curr
  end

  min = 1000
  curr_min = '1'*1000

  for i in 0..n-1
    for j in 0..i
      if cnt[i+1] - cnt[j] == k
        if i+1-j < min
          min = i+1-j
          curr_min = s[j..i]
        elsif i+1-j == min
          curr_min = [curr_min, s[j..i]].min
        end
      end
    end
  end

  curr_min == '1' * 1000 ? '' : curr_min
end
