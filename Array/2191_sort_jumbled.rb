# @param {Integer[]} mapping
# @param {Integer[]} nums
# @return {Integer[]}
# Link: https://leetcode.com/problems/sort-the-jumbled-numbers/description/
def sort_jumbled(mapping, nums)
  a = Hash.new

  for i in 0..nums.length-1
    digits = nums[i].to_s.split('')
    c = []
    for j in 0..digits.length-1
      c << mapping[digits[j].to_i]
    end
    map = c.join('').to_i
    a[map] = [] if a[map].nil?
    a[map] << nums[i]
  end

  sorted = a.sort_by {|key, _value| key}
  res = []
  sorted.each do |st|
    res.concat(st[1])
  end

  res
end
