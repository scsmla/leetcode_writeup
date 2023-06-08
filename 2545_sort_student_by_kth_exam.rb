# @param {Integer[][]} score
# @param {Integer} k
# @return {Integer[][]}
# Link: https://leetcode.com/problems/sort-the-students-by-their-kth-score/description/
def sort_the_students(score, k)
  score.sort_by{|x| x[k]}.reverse
end
