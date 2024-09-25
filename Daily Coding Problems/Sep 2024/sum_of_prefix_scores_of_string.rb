# @param {String[]} words
# @return {Integer[]}
class Trie
  attr_accessor :root

  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    node = @root

    word.chars.each do |char|
      if node.children[char].nil?
        node.children[char] = TrieNode.new
      else
        node.children[char].count += 1
      end
      node = node.children[char]
    end
  end

  def count_start_with_node(char, node)
    return nil if node.children[char].nil?
    return node.children[char]
  end
end

class TrieNode
  attr_accessor :children, :is_word, :count

  def initialize
    @children = Hash.new
    @is_word = false
    @count = 1
  end
end


def sum_prefix_scores(words)
  n = words.length
  res = []

  trie = Trie.new

  words.each do |word|
    trie.insert(word)
  end

  for i in 0..words.length-1
    curr = 0
    prefix = ''
    node = trie.root
    words[i].chars.each do |char|
      node = trie.count_start_with_node(char, node)
      break if node.nil?

      curr += node.count
    end

    res << curr
  end

  res
end
