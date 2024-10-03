# @param {Integer[]} arr
# @return {Integer[]}
def array_rank_transform(arr)
  temp = arr.sort
  hash = Hash.new
  rank = 1
  hash[temp[0]] = rank

  for i in 1..temp.length-1
    rank += 1 if temp[i] > temp[i-1]
    hash[temp[i]] = rank
  end

  for i in 0..arr.length-1
    arr[i] = hash[arr[i]]
  end

  arr
end
