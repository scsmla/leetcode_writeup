# @param {String} num
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-operations-to-make-a-special-number/description/
def minimum_operations(num)
  # 00, 25, 50, 75
  min = num.length

  if num.count('0') == 1
    min = num.length-1
  end

  first_0 = nil

  for i in (num.length-1).downto(0)
    if num[i] == '0' && first_0.nil?
      first_0 = i
      next
    end

    if !first_0.nil?
      if num[i] == '0' || num[i] == '5'
        min = [min, num.length-i-2].min
        break
      end
    end
  end

  first_5 = nil

  for i in (num.length-1).downto(0)
    if num[i] == '5' && first_5.nil?
      first_5 = i
      next
    end

    if !first_5.nil?
      if num[i] == '2' || num[i] == '7'
        min = [min, num.length-i-2].min
        break
      end
    end
  end

  min
end
