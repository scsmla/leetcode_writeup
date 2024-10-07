# @param {String} sentence1
# @param {String} sentence2
# @return {Boolean}
def are_sentences_similar(sentence1, sentence2)
  words1 = sentence1.split(' ')
  words2 = sentence2.split(' ')

  if words1.length > words2.length
    check(sentence1, sentence2)
  elsif words1.length < words2.length
    check(sentence2, sentence1)
  else
    words1 == words2
  end
end

def check(s1, s2)
  words1 = s1.split(' ')
  words2 = s2.split(' ')


  prefix_index = 0
  while(prefix_index < words2.length && words1[prefix_index] == words2[prefix_index])
    prefix_index += 1
  end

  postfix_index = words2.length-1
  j = words1.length-1

  while(postfix_index >= 0 && words1[j] == words2[postfix_index])
    postfix_index -= 1
    j -= 1
  end

  prefix_index > postfix_index
end
