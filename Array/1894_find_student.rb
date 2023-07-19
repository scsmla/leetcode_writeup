# @param {Integer[]} chalk
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/find-the-student-that-will-replace-the-chalk/description/
def chalk_replacer(chalk, k)
  sum = chalk.sum
  k = k % sum
  curr = 0

  for i in 0..chalk.length-1
    curr += chalk[i]

    return i if curr > k
  end
end
