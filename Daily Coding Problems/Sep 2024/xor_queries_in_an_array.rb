# @param {Integer[]} arr
# @param {Integer[][]} queries
# @return {Integer[]}
def xor_queries(arr, queries)
  n = arr.length
  prefix = Array.new(n, 0)
  curr = 0

  for i in 0..n-1
    curr ^= arr[i]
    prefix[i] = curr
  end

  res = []

  print prefix

  queries.each do |start_idx, end_idx|
    if start_idx == 0
      res << prefix[end_idx]
    else
      res << (prefix[end_idx] ^ prefix[start_idx-1])
    end
  end

  res
end
