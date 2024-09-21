# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
  n = nums.length
  nums = nums.map{|x| x.to_s}
  nums = nums.sort{|x,y| x+y <=> y+x}.reverse
  res = nums.join('')
  j = -1

  for i in 0..res.length-2
    if res[i] == '0'
        j = i
        next
    else
        break
    end
  end
  j == -1 ? res : res[j+1..-1]
end
