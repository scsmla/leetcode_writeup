# @param {Integer[]} arr
# @return {Boolean}
def can_reorder_doubled(arr)
  arr = arr.sort
  return false if arr.count{|x| x < 0} % 2 == 1
  return false if arr.count{|x| x == 0} % 2 == 1
  neg = arr.select{|x| x < 0}.reverse
  pos = arr.select{|x| x > 0}
  neg_hash = neg.tally
  pos_hash = pos.tally

  for i in 0..pos.length-1
    next if pos_hash[pos[i]].to_i == 0
    return false if pos_hash[pos[i] * 2].to_i <= 0
    pos_hash[pos[i]] -= 1
    pos_hash[pos[i]*2] -= 1
  end

  for i in 0..neg.length-1
    next if neg_hash[neg[i]].to_i == 0
    return false if neg_hash[neg[i] * 2].to_i <= 0
    neg_hash[neg[i]] -= 1
    neg_hash[neg[i]*2] -= 1
  end

  true
end
