# @param {Integer[]} tasks
# @param {Integer} space
# @return {Integer}
# Link: https://leetcode.com/problems/task-scheduler-ii/
def task_scheduler_ii(tasks, space)
  n = tasks.length
  a = Hash.new
  cnt = 0
  tasks.each do |t|
    cnt += 1
    if !a[t].nil? && cnt - a[t] <= space
      cnt += space - (cnt - a[t].to_i) + 1
    end
    a[t] = cnt
  end
  cnt
end
