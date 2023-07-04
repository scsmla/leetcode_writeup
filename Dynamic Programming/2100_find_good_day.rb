# @param {Integer[]} security
# @param {Integer} time
# @return {Integer[]}
# Link: https://leetcode.com/problems/find-good-days-to-rob-the-bank/description/
def good_days_to_rob_bank(security, time)
  n = security.length
  dec = Array.new(n, 0)
  inc = Array.new(n, 0)

  for i in 1..n-1
    if security[i] <= security[i-1]
      dec[i] = dec[i-1] + 1
    else
      dec[i] = 0
    end
  end

  for i in (n-2).downto(0)
    if security[i+1] >= security[i]
      inc[i] = inc[i+1] + 1
    else
      inc[i] = 0
    end
  end

  res = []
  for i in 0..n-1
    res.push(i) if dec[i] >= time && inc[i] >= time
  end

  res
end
