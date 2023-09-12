# @param {Integer[]} arr
# @return {Integer}
# Link: https://leetcode.com/problems/longest-turbulent-subarray/
def max_turbulence_size(arr)
  n = arr.length
  f1 = Array.new(n, 0)
  f2 = Array.new(n, 0)
  max = 1
  f1[n-1] = 1
  f2[n-1] = 1

  for i in (n-2).downto(0)
    if i % 2 == 1
      if arr[i] > arr[i+1]
        f1[i] = f1[i+1] + 1
        f2[i] = 1
      elsif arr[i] < arr[i+1]
        f2[i] = f2[i+1] + 1
        f1[i] = 1
      else
        f1[i] = 1
        f2[i] = 1
      end
    else
      if arr[i] > arr[i+1]
        f2[i] = f2[i+1] + 1
        f1[i] = 1
      elsif arr[i] < arr[i+1]
        f1[i] = f1[i+1] + 1
        f2[i] = 1
      else
        f1[i] = 1
        f2[i] = 1
      end
    end

    max = [max, f1[i], f2[i]].max
  end

  max
end
