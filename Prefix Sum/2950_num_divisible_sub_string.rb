# @param {String} word
# @return {Integer}
# Link: https://leetcode.com/problems/number-of-divisible-substrings/
def count_divisible_substrings(word)
  n = word.length
  prefix_sum = Array.new(n+1, 0)
  hash = Hash.new
  curr = 1
  ('a'..'z').to_a.each do |char|
    curr += 1 if ['c', 'f', 'i', 'l', 'o', 'r', 'u', 'x'].include?(char)
    hash[char] = curr
  end

  for i in 1..n
    curr = hash[word[i-1]]
    prefix_sum[i] = prefix_sum[i-1] + curr
  end

  res = 0

  for i in 0..n-1
    for j in 0..i
      sum = prefix_sum[i+1] - prefix_sum[j]

      res += 1 if sum % (i-j+1) == 0
    end
  end

  res
end
