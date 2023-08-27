# @param {Integer[]} arr
# @return {Integer}
def maximum_sum(arr)
  n = arr.length
  max_s = Array.new(n ,0)
  max_e = Array.new(n, 0)
  max_s[0] = arr[0]
  max_e[n-1] = arr[n-1]

  for i in 1..n-1
    max_s[i] = [arr[i], max_s[i-1]+arr[i]].max
  end

  for i in (n-2).downto(0)
    max_e[i] = [arr[i], max_e[i+1]+arr[i]].max
  end

  max = [max_s[0], max_e[n-1], max_s[n-1], max_e[0]].max

  # print max_s
  # puts ''
  # print max_e

  for i in 1..n-2
    max = [max_s[i-1] + max_e[i+1], max_s[i], max_e[i], max].max
  end

  max
end
