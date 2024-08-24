# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
  n = citations.length
  p_sum = Array.new(1001, 0)

  for i in 0..n-1
    p_sum[citations[i]] += 1
  end

  h_index = 0
  curr = n

  for i in 0..1000
    h_index = [h_index, i].max if curr >= i
    curr -= p_sum[i]
  end

  h_index
end
