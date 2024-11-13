# @param {Integer} n
# @return {Integer[]}
# Time complexity: O(nlogn)
# Space complexity: O(n)
def count_bits(n)
  (0..n).to_a.map{|num| num.to_s(2).count('1')}
end


# @param {Integer} n
# @return {Integer[]}
# Time complexity: O(n)
# Space complexity: O(n)
def count_bits(n)
  res = Array.new(n+1, 0)
  nex = 1
  prev = 1

  for i in 1..n
    if i == nex
      prev = nex
      nex *= 2
      res[i] = 1
    else
      res[i] = res[prev] + res[i-prev]
    end
  end

  res
end
