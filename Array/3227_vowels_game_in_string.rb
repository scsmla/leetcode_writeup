# @param {String} s
# @return {Boolean}
def does_alice_win(s)
  s.chars.any?{|char| 'aeiou'.include?(char)}
end
