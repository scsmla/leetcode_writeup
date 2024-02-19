# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
  n = temperatures.length
  res = Array.new(n, 0)
  stack = []

  for i in 0..n-1
    if !stack.empty? && temperatures[i] > temperatures[stack[-1]]
      while(!stack.empty? && temperatures[i] > temperatures[stack[-1]])
        curr = stack.pop
        res[curr] = i-curr
      end
    end

    stack << i
  end

  res
end
