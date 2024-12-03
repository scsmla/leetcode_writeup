# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def find_champion(n, edges)
  inc = Array.new(n, 0)

  edges.each do |edge|
    stronger, weaker = edge
    inc[weaker] += 1
  end

  champions = inc.each_index.select{|idx| inc[idx] == 0}
  champions.length == 1 ? champions[0] : -1
end
