# @param {String} croak_of_frogs
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-number-of-frogs-croaking/description/
def min_number_of_frogs(croak_of_frogs)
  a = Hash.new

  'croak'.split('').each do |char|
    a[char] = 0
  end

  min = 0

  for i in 0..croak_of_frogs.length-1
    if croak_of_frogs[i] == 'c'
      a['c'] += 1
      if a['c'] > a['k']
        if a['k'] > 0
          a['k'] -= 1
        else
          min += 1
        end
      end
    elsif croak_of_frogs[i] == 'r'
      return -1 if a['c'] <= 0
      a['c'] -= 1
      a['r'] += 1
    elsif croak_of_frogs[i] == 'o'
      return -1 if a['r'] <= 0
      a['r'] -= 1
      a['o'] += 1
    elsif croak_of_frogs[i] == 'a'
      return -1 if a['o'] <= 0
      a['o'] -= 1
      a['a'] += 1
    else
      return -1 if a['a'] <= 0
      a['a'] -= 1
      a['k'] += 1
    end
  end

  'croa'.split('').each do |char|
    return -1 if a[char] > 0
  end

  min
end
