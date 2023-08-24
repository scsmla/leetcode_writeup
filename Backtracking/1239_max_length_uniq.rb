# @param {String[]} arr
# @return {Integer}
def max_length(arr)
  @max = 0
  backtrack(arr, 0, [])
  @max
end

def backtrack(arr, start, path)
  if start >= arr.length
    @max = [@max, path.join('').length].max
    return
  end
  return backtrack(arr, start+1, path) if arr[start].chars.uniq.length < arr[start].length
  return backtrack(arr, start+1, path) if (arr[start].chars - path.join('').chars).length < arr[start].length

  path += [arr[start]]
  @max = [@max, path.join('').length].max
  # puts @max
  # puts path
  # puts start
  # puts '----'
  backtrack(arr, start+1, path)
  path -= [arr[start]]
  backtrack(arr, start+1, path)
end
