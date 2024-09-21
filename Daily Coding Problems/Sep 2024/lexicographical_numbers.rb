# @param {Integer} n
# @return {Integer[]}
def lexical_order(n)
  (1..n).to_a.map{|x| x.to_s}.sort.map{|x| x.to_i}
end
