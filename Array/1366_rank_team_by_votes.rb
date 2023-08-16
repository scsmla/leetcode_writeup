# @param {String[]} votes
# @return {String}
# Link: https://leetcode.com/problems/rank-teams-by-votes/description/
def rank_teams(votes)
  n = votes.length
  prizes = votes[0].length
  count = Array.new(26){Array.new(prizes, 0)}

  for i in 0..n-1
    for j in 0..prizes-1
      c = votes[i][j].ord-65
      count[c][j] += 1
    end
  end

  res = Array.new(prizes, "")
  chars = votes[0].split("").sort

  for i in 0..prizes-1
    curr = 0
    for j in 0..prizes-1
      next if i == j

      greater = i < j
      c1 = chars[i].ord-65
      c2 = chars[j].ord-65

      for k in 0..prizes-1
        if count[c1][k] > count[c2][k]
          greater = true
          break
        elsif count[c1][k] < count[c2][k]
          greater = false
          break
        end
      end

      curr += 1 if greater
    end

    res[curr] = chars[i]
  end

  res.reverse.join('')
end
