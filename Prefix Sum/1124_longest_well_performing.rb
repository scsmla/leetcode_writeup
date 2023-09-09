# @param {Integer[]} hours
# @return {Integer}
# Link: https://leetcode.com/problems/longest-well-performing-interval/description/
def longest_wpi(hours)
  s = 0
  a = Hash.new
  res = 0

  for i in 0..hours.length-1
    if hours[i] > 8
      s += 1
    else
      s -= 1
    end

    if s > 0
      res = i + 1
    else
      a[s] = i if a[s].nil?
      if !a[s-1].nil?
        res = [res, i-a[s-1]].max
      end
    end
  end

  res
end
