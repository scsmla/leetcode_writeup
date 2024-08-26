# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  n = s.length
  max = 0
  left, right = 0, 0
  a = Hash.new

  while(right < n)
    curr = s[right]
    a[curr] ||= 0
    a[curr] += 1

    if a[curr] > 1
      while(a[curr] > 1)
        a[s[left]] -= 1
        left += 1
      end
    end

    max = [max, right-left+1].max
    right += 1
  end

  max
end
