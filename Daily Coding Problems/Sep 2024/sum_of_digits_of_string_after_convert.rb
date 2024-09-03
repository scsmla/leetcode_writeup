# @param {String} s
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/sum-of-digits-of-string-after-convert/?envType=daily-question&envId=2024-09-03

def get_lucky(s, k)
  nums = s.chars.map{|x| x.ord-96}.join('')

  while(k > 0)
    nums = nums.chars.map{|x| x.to_i}.sum
    nums = nums.to_s
    k -= 1
  end

  nums.to_i
end
