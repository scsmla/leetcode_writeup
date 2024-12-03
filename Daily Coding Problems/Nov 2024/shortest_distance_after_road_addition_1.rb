# @param {Integer} n
# @param {Integer[][]} queries
# @return {Integer[]}
def shortest_distance_after_queries(n, queries)
  m = queries.length
  adj = Hash.new
  dp = (0..n-1).to_a
  res = []

  for i in 0..m-1
    s, e = queries[i]
    dp[e] = [dp[s] + 1, dp[e]].min
    adj[e] ||= []
    adj[e] << s

    for j in 1..n-1
      dp[j] = [dp[j], dp[j-1] + 1].min
      next if adj[j].nil?

      adj[j].each do |k|
        dp[j] = [dp[j], dp[k] + 1].min
      end
    end

    res << dp[n-1]
  end

  res
end
