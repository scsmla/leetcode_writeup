# @param {Integer[]} differences
# @param {Integer} lower
# @param {Integer} upper
# @return {Integer}
# Link: https://leetcode.com/problems/count-the-hidden-sequences/description/
def number_of_arrays(differences, lower, upper)
  for i in lower..upper
    j = 0
    curr = i
    while(j < differences.length)
      if curr >= lower && curr <= upper
        curr += differences[j]
        j += 1
      else
        break
      end
    end

    break if j >= differences.length && curr >= lower && curr <= upper
  end

  return 0 if j < differences.length || curr < lower || curr > upper

  curr = i
  max = curr
  for i in 0..differences.length-1
    curr += differences[i]
    max = [curr, max].max
  end

  upper - max + 1
end
