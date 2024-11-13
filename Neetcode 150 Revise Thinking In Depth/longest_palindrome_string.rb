# @param {String} s
# @return {String}
# Time complexity: O(n^2)
# Space complexity: O(1)
def longest_palindrome(s)
  n = s.length
  max = 0
  res = ''

  for i in 0..s.length-1
    left = i
    right = i

    while(left >= 0 && right <= n-1 && s[left] == s[right])
      if right-left+1 > max
        res = s[left..right]
        max = right-left+1
      end

      left -= 1
      right += 1
    end

    left = i
    right = i+1

    while(left >= 0 && right <= n-1 && s[left] == s[right])
      if right-left+1 > max
        res = s[left..right]
        max = right-left+1
      end

      left -= 1
      right += 1
    end
  end

  res
end
