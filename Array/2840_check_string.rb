# @param {String} s1
# @param {String} s2
# @return {Boolean}
# Link: https://leetcode.com/problems/check-if-strings-can-be-made-equal-with-operations-ii/description/
def check_strings(s1, s2)
  odd_1 = []
  odd_2 = []
  even_1 = []
  even_2 = []

  for i in 0..s1.length-1
    if i % 2 == 0
      even_1 << s1[i]
      even_2 << s2[i]
    else
      odd_1 << s1[i]
      odd_2 << s2[i]
    end
  end

  return true if even_1.sort == even_2.sort && odd_1.sort == odd_2.sort

  false
end
