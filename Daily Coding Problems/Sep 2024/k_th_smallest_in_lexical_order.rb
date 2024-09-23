# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def find_kth_number(n, k)
  k -= 1
  curr = 1

  while(k > 0)
    steps = cal_steps(n, curr, curr+1)

    if steps <= k
      k -= steps
      curr += 1
    else
      k -= 1
      curr *= 10
    end
  end

  return curr
end

def cal_steps(n, n1, n2)
  steps = 0

  while(n1 <= n)
    steps += [n2, n+1].min - n1
    n1 *= 10
    n2 *= 10
  end

  return steps
end
