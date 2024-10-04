# @param {Integer[]} skill
# @return {Integer}
def divide_players(skill)
  skill = skill.sort
  n = skill.length
  res = 0
  target = skill.sum * 2 / n

  for i in 0..n/2-1
    return -1 if skill[i] + skill[n-1-i] != target

    res += skill[i] * skill[n-1-i]
  end

  res
end
