# @param {Integer[]} changed
# @return {Integer[]}
# Link: https://leetcode.com/problems/find-original-array-from-doubled-array/description/
def find_original_array(changed)
  n = changed.length
  return [] if n % 2 == 1

  res = []
  a = Hash.new
  for i in 0..changed.length-1
    a[changed[i]] = 0 if a[changed[i]].nil?
    a[changed[i]] += 1
  end

  changed = changed.sort
  res = []
  for i in (n-1).downto(0)
    next if changed[i] % 2 == 1 || a[changed[i]].to_i == 0

    if changed[i] == 0
      if a[0] >= 2
        a[0] -= 2
        res.push(0)
      end
    elsif a[changed[i] / 2].to_i > 0
      res.push(changed[i]/2)
      a[changed[i]] -= 1
      a[changed[i]/2] -= 1
    end

    break if res.length == n/2
  end

  res.length == n/2 ? res : []
end
