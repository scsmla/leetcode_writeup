# @param {String} s
# @param {Integer[][]} queries
# @return {Integer[]}
# Link: https://leetcode.com/problems/plates-between-candles/description/
def plates_between_candles(s, queries)
  n = s.length
  p_sum = Array.new(n, 0)
  p_sum[0] = 1 if s[0] == '|'

  for i in 1..s.length-1
    if s[i] == '|'
      p_sum[i] = p_sum[i-1] + 1
    else
      p_sum[i] = p_sum[i-1]
    end
  end

  curr = -1

  left = Array.new(n, 0)
  for i in 0..s.length-1
    if s[i] == '|'
      curr = i
    end

    left[i] = curr
  end

  right = Array.new(n, 0)
  curr = -1

  for i in (n-1).downto(0)
    if s[i] == '|'
      curr = i
    end

    right[i] = curr
  end

  res = []

  for i in 0..queries.length-1
    s, e = queries[i]
    if s == 0
      target = 0
    else
      target = p_sum[s-1]
    end

    if target == p_sum[e] || p_sum[e] - target == 1
      res.push(0)
    else
      r = right[s]
      l = left[e]
      res.push(l-r+1 - (p_sum[e] - target))
    end
  end

  res
end
