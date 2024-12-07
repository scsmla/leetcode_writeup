# @param {Integer[]} banned
# @param {Integer} n
# @param {Integer} max_sum
# @return {Integer}
def max_count(banned, n, max_sum)
  banned_hash = Hash.new

  banned.each do |num|
    banned_hash[num] = 1
  end

  res = 0
  total = 0

  for i in 1..n
    break if total + i > max_sum
    next if banned_hash[i].to_i == 1

    res += 1
    total += i
  end

  res
end
