# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/least-number-of-unique-integers-after-k-removals/description/
def find_least_num_of_unique_ints(arr, k)
  a = Hash.new

  for i in 0..arr.length-1
    a[arr[i]] = 0 if a[arr[i]].nil?
    a[arr[i]] += 1
  end

  t = a.sort_by{|x| x[1]}
  j = 0
  while(k > 0 && j < t.length)
    if k >= t[j][1]
      k -= t[j][1]
      j += 1
    else
      k = 0
    end
  end

  t.length - j
end
