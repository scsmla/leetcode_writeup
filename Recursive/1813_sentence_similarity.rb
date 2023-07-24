# @param {String} sentence1
# @param {String} sentence2
# @return {Boolean}
# Link: https://leetcode.com/problems/sentence-similarity-iii/description/
def are_sentences_similar(sentence1, sentence2)
  words1 = sentence1.split(' ')
  words2 = sentence2.split(' ')

  if words1.length == words2.length
    return words1 == words2
  else
    if words1.length > words2.length
      check(words2, words1, true)
    else
      check(words1, words2, true)
    end
  end
end

def check(origin, target, both_direct)
  return true if origin.length == 0
  return false if origin[0] != target[0] && origin[0] != target[-1] && origin[-1] != target[-1]

  cond = false

  if origin[0] == target[0]
    cond ||= check(origin[1..-1], target[1..-1], true) && both_direct
  end

  if origin[0] == target[-1]
    cond ||= check(origin[1..-1], target[0..--2], false) && both_direct
  end

  if origin[-1] == target[-1]
    cond ||= check(origin[0..-2], target[0..-2], true) && both_direct
  end

  cond
end
