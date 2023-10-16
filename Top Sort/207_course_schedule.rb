# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
# Link: https://leetcode.com/problems/course-schedule/
def can_finish(num_courses, prerequisites)
  inc = Array.new(num_courses, 0)
  into = Array.new(num_courses){Array.new}

  for i in 0..prerequisites.length-1
    s, e = prerequisites[i]
    inc[e] += 1
    into[s] << e
  end

  queue = []
  cnt = 0
  for i in 0..num_courses-1
    if inc[i] == 0
      queue << i
      cnt += 1
    end
  end

  while(!queue.empty?)
    l = queue.length

    for _ in 0..l-1
      curr = queue.shift

      for i in 0..into[curr].length-1
        inc[into[curr][i]] -= 1
        if inc[into[curr][i]] == 0
          queue << into[curr][i]
          cnt += 1
        end
      end
    end
  end

  cnt >= num_courses
end
