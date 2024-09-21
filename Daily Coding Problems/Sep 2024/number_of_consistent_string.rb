# @param {String} allowed
# @param {String[]} words
# @return {Integer}
def count_consistent_strings(allowed, words)
  count = words.length

  words.each do |word|
    word.chars.each do |char|
      if !allowed.include?(char)
        count -= 1
        break
      end
    end
  end

  count
end
