# @param {String} s
# @return {Integer}
def min_length(s)
  while(s.include?('AB') || s.include?('CD'))
    s.slice!('AB')
    s.slice!('CD')
  end

  s.length
end
