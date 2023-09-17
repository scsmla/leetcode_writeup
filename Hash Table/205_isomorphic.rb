# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  a = Hash.new
  b = Hash.new

  for i in 0..s.length-1
    if a[s[i]].nil? && b[t[i]].nil?
      a[s[i]] = t[i]
      b[t[i]] = s[i]
    else
      return false if a[s[i]] != t[i] || b[t[i]] != s[i]
    end
  end

  true
end
