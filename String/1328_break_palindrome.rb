# @param {String} palindrome
# @return {String}
#Link: https://leetcode.com/problems/break-a-palindrome/description/
def break_palindrome(palindrome)
  n = palindrome.length
  return '' if n == 1

  replace = false

  for i in 0..n-1
    next if palindrome[i] == 'a'

    if (palindrome[i] != 'a' && n % 2 == 0) || (n % 2 == 1 && i != n/2)
      palindrome[i] = 'a'
      replace = true
      break
    end
  end


  if !replace && palindrome[-1] == 'a'
    palindrome[-1] = 'b'
  end

  palindrome
end
