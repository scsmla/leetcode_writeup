# @param {Integer[]} processor_time
# @param {Integer[]} tasks
# @return {Integer}
# LinK: https://leetcode.com/problems/minimum-processing-time/description/
def min_processing_time(processor_time, tasks)
  n = processor_time.length
  m = tasks.length
  processor_time = processor_time.sort
  tasks = tasks.sort.reverse
  min = 0

  for i in 0..n-1
    min = [min, processor_time[i] + tasks[i*4]].max
  end

  min
end
