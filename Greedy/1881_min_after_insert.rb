# @param {String} n
# @param {Integer} x
# @return {String}
# Link: https://leetcode.com/problems/maximum-value-after-insertion/description/
def max_value(n, x)
  if n[0] == '-'
    is_neg = true
    start_idx = 1
  else
    if_neg = false
    start_idx = 0
  end

  if is_neg
    for i in start_idx..n.length-1
      break if n[i].to_i > x
    end

    if i < n.length-1
      n = n[0..i-1] + x.to_s + n[i..-1]
    else
      if i == n.length-1
        if n[i].to_i > x
          n = n[0..-2] + x.to_s + n[-1]
        else
          n = n + x.to_s
        end
      end
    end
  else
    for i in start_idx..n.length-1
      break if n[i].to_i < x
    end

    if i > 0 && i < n.length-1
      n = n[0..i-1] + x.to_s + n[i..-1]
    elsif i == n.length-1
      if n[i].to_i > x
        n = n + x.to_s
      else
        n = n[0..-2] + x.to_s + n[-1]
      end
    else
      n = x.to_s + n
    end
  end

  n
end
