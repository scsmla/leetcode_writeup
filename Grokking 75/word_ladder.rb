# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
def ladder_length(begin_word, end_word, word_list)
  word_count = Hash.new
  word_list.unshift(begin_word)
  n = word_list.length
  queue = [begin_word]
  result = 1
  unvisited = Set.new

  word_list.each do |word|
    unvisited << word
  end

  while(!queue.empty?)
    l = queue.length

    for i in 0..l-1
      curr_word = queue.shift
      return result if curr_word == end_word

      for j in 0..curr_word.length-1
        ('a'..'z').to_a.each do |char|
          temp = curr_word.dup
          temp[j] = char

          if unvisited.include?(temp)
            queue << temp
            unvisited.delete(temp)
          end
        end
      end
    end

    result += 1
  end

  return 0
end
