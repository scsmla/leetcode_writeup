# @param {String} s
# @param {Integer} k
# @return {Integer}
def max_vowels(s, k)
  max = 0
  n = s.length
  count = s[0..k-1].chars.select{|x| ['a', 'e', 'i', 'o', 'u'].include?(x)}.count
  max = [max, count].max

  for i in 0..n-k-1
    if ['a', 'e', 'i', 'o', 'u'].include?(s[i])
      count -= 1
    end

    if ['a', 'e', 'i', 'o', 'u'].include?(s[i+k])
      count += 1
    end

    max = [max, count].max
  end

  max
end
