# @param {String} customers
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-penalty-for-a-shop/description/
def best_closing_time(customers)
  c_y, c_n = 0, 0
  n = customers.length
  c_y = customers.chars.select{|x| x == 'Y'}.count
  min = 10**5
  min_h = 0

  for i in 0..customers.length
    pen = c_n + c_y
    if pen < min
      min_h = i
      min = pen
    end
    if i < customers.length
      c_y -= 1 if customers[i] == 'Y'
      c_n += 1 if customers[i] == 'N'
    end
  end

  min_h
end
