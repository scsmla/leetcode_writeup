# @param {Integer} n
# @param {Integer[][]} trust
# @return {Integer}
def find_judge(n, trust)
  hash_trusted = Hash.new
  hash_trust = Hash.new

  for i in 0..trust.length-1
    p_trust, p_trusted = trust[i]
    hash_trusted[p_trusted] ||= 0
    hash_trusted[p_trusted] += 1
    hash_trust[p_trust] ||= 0
    hash_trust[p_trust] += 1
  end

  for i in 1..n
    return i if hash_trusted[i].to_i == n-1 && hash_trust[i].to_i == 0
  end

  return -1
end
