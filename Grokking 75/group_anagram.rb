# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  n = strs.length
  a = Hash.new

  for i in 0..n-1
    sorted_str = strs[i].chars.sort.join('')
    a[sorted_str] = [] if a[sorted_str].nil?
    a[sorted_str] << strs[i]
  end

  a.values
end
