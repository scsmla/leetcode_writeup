# @param {Integer} n
# @param {Integer} x
# @return {Integer}
def min_end(n, x)
  x_bit = x.to_s(2)
  n_bit = (n-1).to_s(2)

  prefix = 64 - x_bit.length
  x_bit = '0' * prefix + x_bit

  prefix = 64 - n_bit.length
  n_bit = '0' * prefix + n_bit
  j = 63

  for i in 63.downto(0)
    next if x_bit[i] == '1'
    x_bit[i] = n_bit[j]
    j -= 1
  end

  x_bit.to_i(2)
end
