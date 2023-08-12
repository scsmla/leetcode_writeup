# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @param {Integer[][]} queries
# @return {Boolean[]}
# Link: https://leetcode.com/problems/course-schedule-iv/
def check_if_prerequisite(num_courses, prerequisites, queries)
  check = Array.new(num_courses){Array.new(num_courses, false)}

  for i in 0..prerequisites.length-1
    x, y = prerequisites[i]
    check[x][y] = true
  end

  for k in 0..num_courses-1
    for i in 0..num_courses-1
      for j in 0..num_courses-1
        check[i][j] = check[i][j] || (check[i][k] && check[k][j])
      end
    end
  end
  res = []

  for i in 0..queries.length-1
    x, y = queries[i]
    if check[x][y]
      res << true
    else
      res << false
    end
  end

  res
end
