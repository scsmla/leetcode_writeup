# @param {Integer[]} hours
# @return {Integer}
def count_complete_day_pairs(hours)
  count = 0

  for i in 0..hours.length-1
    for j in i+1..hours.length-1
      count += 1 if (hours[i] + hours[j]) % 24 == 0
    end
  end

  count
end
