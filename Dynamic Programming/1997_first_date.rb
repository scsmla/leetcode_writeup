# @param {Integer[]} next_visit
# @return {Integer}
# Link: https://leetcode.com/problems/first-day-where-you-have-been-in-all-the-rooms/description/
def first_day_been_in_all_rooms(next_visit)
  n = next_visit.length
  mod = 10**9 + 7
  dp = Array.new(n, 0)

  for i in 1..n-1
    dp[i] = (dp[i-1]*2 - dp[next_visit[i-1]] + 2) % mod
  end

  dp[-1] % mod
end
