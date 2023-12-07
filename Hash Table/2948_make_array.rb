# @param {Integer[]} nums
# @param {Integer} limit
# @return {Integer[]}
def lexicographically_smallest_array(nums, limit)
  sub_a = []
  n = nums.length

  for i in 0..n-1
    sub_a << [nums[i], i]
  end

  sub_a = sub_a.sort_by{|x| x[0]}
  sorted_sub_a = [[sub_a[0]]]

  for i in 1..n-1
    if sub_a[i][0] - sub_a[i-1][0] <= limit
      sorted_sub_a[-1] << sub_a[i]
    else
      sorted_sub_a << [sub_a[i]]
    end
  end

  # print sorted_sub_a

  res = Array.new(n, 0)

  sorted_sub_a.each do |sorted|
    curr = []
    sorted.each do |x, y|
      curr << y
    end

    curr = curr.sort

    # print curr

    # puts '-----'

    for i in 0..curr.length-1
      res[curr[i]] = sorted[i][0]
    end
  end

  res
end
