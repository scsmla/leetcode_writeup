# @param {String} s
# @return {Integer[]}
# Link: https://leetcode.com/problems/partition-labels/
def partition_labels(s)
  a = Hash.new

  for i in 0..s.length-1
    if a[s[i]].nil?
      a[s[i]] = [i]
    elsif a[s[i]].length == 1
      a[s[i]] << i
    else
      a[s[i]][1] = i
    end
  end

  cnt = 0
  curr_last = 0

  res = []
  prev_curr = -1

  for i in 0..s.length-1
    if a[s[i]].max > curr_last
      curr_last = a[s[i]].max.to_i
    end

    if i == curr_last
      res << curr_last - prev_curr
      prev_curr = curr_last
    end
  end

  res
end
