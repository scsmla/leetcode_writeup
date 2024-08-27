# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
  n = temperatures.length
  wait = Array.new(n , 0)
  stack = []

  for i in 0..n-1
    if stack.empty?
      stack << i
    else
      if temperatures[stack[-1]] < temperatures[i]
        while(!stack.empty? && temperatures[stack[-1]] < temperatures[i])
          curr = stack.pop
          wait[curr] = i - curr
        end
      end

      stack << i
    end
  end

  wait
end
