# @param {Integer[]} scores
# @param {Integer[]} ages
# @return {Integer}
# Link: https://leetcode.com/problems/best-team-with-no-conflicts/description/
def best_team_score(scores, ages)
  age_score = []
  n = scores.length

  for i in 0..ages.length-1
    age_score.push([ages[i], scores[i]])
  end

  age_score = age_score.sort_by{|x| [x[0], x[1]]}
  dp = Array.new(n, 0)
  ans = 0

  for i in 0..n-1
    score = age_score[i][1]
    dp[i] = score

    for j in 0..i-1
      if score >= age_score[j][1]
        dp[i] = [dp[i], dp[j]+score].max
      end
    end

    ans = [ans, dp[i]].max
  end

  ans
end
