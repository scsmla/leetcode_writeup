# @param {String} s
# @param {String[]} dictionary
# @return {Integer}
def min_extra_char(s, dictionary)
  n = s.length
  dp = Array.new(n+1, 1000)
  dp[0] = 0
  hash = Hash.new

  dictionary.each do |word|
    hash[word] = 1
  end

  for i in 0..s.length-1
    for j in i..s.length-1
      word = s[i..j]
      if hash[word].to_i == 1
        dp[j+1] = [dp[i], dp[j+1]].min
      else
        dp[j+1] = [dp[i] + (j-i+1), dp[j+1]].min
      end
    end
  end

  dp[n]
end
