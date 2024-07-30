# @param {String} s
# @return {Integer}
def max_operations(s)
  n = s.length

  for i in (n-1).downto(0)
    break if s[i] == '0'
  end

  count = 0
  curr = 0
  j = 0
  while(j <= i)
    if s[j] == '1'
      curr += 1
      j += 1
    else
      count += curr

      while(s[j] == '0')
        j += 1
      end
    end
  end

  count
end
