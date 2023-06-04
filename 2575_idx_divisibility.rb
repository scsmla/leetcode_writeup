# @param {String} word
# @param {Integer} m
# @return {Integer[]}
# Link: https://leetcode.com/problems/find-the-divisibility-array-of-a-string/
def divisibility_array(word, m)
  n = word.length
  res = Array.new(n, 0)
  curr = 0
  for i in 0..n-1
      curr = curr*10 + word[i].to_i
      if curr % m == 0
          res[i] = 1
          curr = 0
      else
          curr = curr % m
      end
  end
  res
end
