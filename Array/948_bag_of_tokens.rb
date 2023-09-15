# @param {Integer[]} tokens
# @param {Integer} power
# @return {Integer}
# Link: https://leetcode.com/problems/bag-of-tokens/
def bag_of_tokens_score(tokens, power)
  tokens = tokens.sort
  score = 0
  i = 0
  n = tokens.length
  j = n-1
  max = 0

  # curr = 0
  while(i <= j)
    if power >= tokens[i]
      power -= tokens[i]
      i += 1
      score += 1
    else
      if score >= 1
        power += tokens[j]
        j -= 1
        score -= 1
      else
        break
      end
    end

    max = [max, score].max
  end

  max
end
