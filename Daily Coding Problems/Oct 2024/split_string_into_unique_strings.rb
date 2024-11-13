# @param {String} s
# @return {Integer}
def max_unique_split(s)
  @max = 0
  dfs(s, 0, 0, Hash.new)
  @max
end

def dfs(s, start_index, count, seen)
  if start_index >= s.length
    @max = [@max, count].max
    return
  end

  for i in start_index+1..s.length
    if seen[s[start_index..i-1]].nil?
      seen[s[start_index..i-1]] = 1
      dfs(s, i, count+1, seen)
      seen[s[start_index..i-1]] = nil
    end
  end
end
