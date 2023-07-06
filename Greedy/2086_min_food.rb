# @param {String} hamsters
# @return {Integer}
def minimum_buckets(hamsters)
  n = hamsters.length

  for i in 0..n-1
    return -1 if i == 0 && hamsters[i+1] == 'H' && hamsters[i] == 'H'
    return -1 if i == n-1 && hamsters[i-1] == 'H' && hamsters[i] == 'H'
    return -1 if hamsters[i] == 'H' && hamsters[i-1] == 'H' && hamsters[i+1] == 'H'
  end

  res = 0
  for i in 0..n-1
    if i == 0
      if hamsters[i] == 'H'
        hamsters[i+1] = 'F'
        res += 1
      end
    elsif i < n-1
      next if hamsters[i-1] == 'F'
      if hamsters[i] == 'H'
        if hamsters[i+1] == '.'
          hamsters[i+1] = 'F'
        else
          hamsters[i-1] = 'F'
        end

        res += 1
      end
    else
      next if hamsters[i-1] == 'F'
      res += 1 if hamsters[i] == 'H'
    end
  end

  res
end
