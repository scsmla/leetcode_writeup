# @param {Integer[]} chalk
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/find-the-student-that-will-replace-the-chalk/description/?envType=daily-question&envId=2024-09-02
def chalk_replacer(chalk, k)
  n = chalk.length
  sum = chalk.sum
  round = k/sum
  k -= round * sum
  curr_sum = 0

  for i in 0..n-1
    curr_sum += chalk[i]

    return i if curr_sum > k
  end
end
