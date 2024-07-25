# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def min_changes(n, k)
  bit_n = n.to_s(2)
  bit_k = k.to_s(2)

  return -1 if bit_n.length < bit_k.length
  bit_k = '0' * (bit_n.length-bit_k.length) + bit_k

  cnt = 0

  for i in (bit_k.length-1).downto(0)
    return -1 if bit_k[i] == '1' && bit_n[i] == '0'

    cnt += 1 if bit_k[i] != bit_n[i]
  end

  cnt
end
