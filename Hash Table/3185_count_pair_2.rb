# @param {Integer[]} hours
# @return {Integer}
def count_complete_day_pairs(hours)
  a = Hash.new

  for i in 0..hours.length-1
    curr = hours[i] % 24
    a[curr] = 0 if a[curr].nil?
    a[curr] += 1
  end

  count = 0

  for i in 0..hours.length-1
    need = (24 - hours[i] % 24) % 24

    next if a[need].nil?

    if need == 0 || need == 12
      count += a[need] - 1
    else
      count += a[need]
    end
  end

  count / 2
end
