# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer}

class TrieNode
  attr_accessor :children, :is_word

  def initialize
    @children = Hash.new
    @is_word = false
  end
end

class Trie
  attr_accessor :root

  def initialize
    @root = TrieNode.new
  end

  def insert(str)
    node = @root

    str.chars.each do |char|
      node.children[char] = TrieNode.new if node.children[char].nil?
      node = node.children[char]
    end

    node.is_word = true
  end

  def start_with?(str)
    node = @root

    str.chars.each do |char|
      return false if node.children[char].nil?
      node = node.children[char]
    end

    true
  end
end

def longest_common_prefix(arr1, arr2)
  trie1 = Trie.new

  arr1.each do |num|
    trie1.insert(num.to_s)
  end

  max = 0

  arr2.each do |num|
    prefix = ''
    num.to_s.chars.each do |digit|
      prefix.concat(digit)
      break if !trie1.start_with?(prefix)
      max = [max, prefix.length].max
    end
  end

  max
end
