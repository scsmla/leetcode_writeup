# @param {String} text
# @return {Integer}
# Link: https://leetcode.com/problems/swap-for-longest-repeated-character-substring/
def max_rep_opt1(text)
  n = text.length
  count = Array.new(26, 0)
  c_s = Array.new(n, 0)
  c_e = Array.new(n, 0)
  c_s[0] = 1
  count[text[0].ord-97] = 1

  for i in 1..n-1
    if text[i] == text[i-1]
      c_s[i] = c_s[i-1] + 1
    else
      c_s[i] = 1
    end

    count[text[i].ord-97] += 1
  end

  c_e[n-1] = 1

  for i in (n-2).downto(0)
    if text[i] == text[i+1]
      c_e[i] = c_e[i+1] + 1
    else
      c_e[i] = 1
    end
  end

  max = [c_s[0], c_e[-1], c_s[-1], c_e[0]].max

  if text.length >= 2 && text[i] == text[-1]
    max = 2
  end

  for i in 1..n-2
    if text[i-1] == text[i+1]
      if c_s[i-1] + c_e[i+1] < count[text[i-1].ord-97]
        max = [max, c_s[i-1] + c_e[i+1] + 1].max
      else
        max = [max, c_s[i-1] + c_e[i+1]].max
      end
    else
      if [c_s[i], c_e[i]].max >= max
        max = [c_s[i], c_e[i]].max
        max += 1 if max < count[text[i].ord-97]
      end
    end
  end

  max
end
