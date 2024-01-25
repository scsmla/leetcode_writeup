# @param {String} s
# @return {Boolean}
# Link: https://leetcode.com/problems/valid-palindrome/description/

def is_palindrome(s)
  i = 0
  j = s.length-1

  while(i < j)
    if !is_valid_char(s[i])
      i += 1
    end

    if !is_valid_char(s[j])
      j -= 1
    end

    if is_valid_char(s[i]) && is_valid_char(s[j])
      return false if s[i].downcase != s[j].downcase

      i += 1
      j -= 1
    end
  end

  true
end

def is_valid_char(char)
  return true if (char.downcase.ord >= 97 && char.downcase.ord <= 122) || (char.downcase.ord >= 48 && char.downcase.ord <= 57)

  false
end
