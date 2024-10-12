# @param {String} s
# @return {Boolean}
# Time complexity: O(n)
# Space complexity: O(n)

def is_palindrome(s)
  string = ""

  for i in 0..s.length-1
    s[i] = s[i].downcase
    string.concat(s[i]) if (s[i].ord >= 97 && s[i].ord <= 122) || (s[i].ord >= 48 && s[i].ord <= 57)
  end

  i = 0
  j = string.length-1

  while(i < j)
    return false if string[i] != string[j]

    i += 1
    j -= 1
  end

  true
end
