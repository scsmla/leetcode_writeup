# @param {Integer[]} time
# @return {Integer}
# Link: https://leetcode.com/problems/pairs-of-songs-with-total-durations-divisible-by-60/description/
def num_pairs_divisible_by60(time)
  a = Hash.new
  cnt = 0

  for i in 0..time.length-1
    a[time[i]%60] = 0 if a[time[i]%60].nil?
    a[time[i]%60] += 1
  end

  for i in 1..29
    cnt += a[i].to_i * a[60-i].to_i
  end

  cnt += a[30].to_i * (a[30].to_i-1)/2
  cnt += a[0].to_i * (a[0].to_i-1)/2

  cnt
end
