# @param {Integer[]} base_costs
# @param {Integer[]} topping_costs
# @param {Integer} target
# @return {Integer}
# Link: https://leetcode.com/problems/closest-dessert-cost/description/
def closest_cost(base_costs, topping_costs, target)
  @result = base_costs[0]

  for i in 0..base_costs.length-1
    make(topping_costs, target, base_costs[i], 0)
  end

  @result
end

def make(topping_costs, target, current, index)
  if (target-@result).abs > (target-current).abs || ((target-@result).abs == (target-current).abs && current < @result)
    @result = current
  end

  return if index >= topping_costs.length || current > target

  make(topping_costs, target, current, index+1)
  make(topping_costs, target, current + topping_costs[index], index+1)
  make(topping_costs, target, current + topping_costs[index]*2, index+1)
end
