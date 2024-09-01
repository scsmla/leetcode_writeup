# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  graph = Hash.new
  inc = Hash.new
  visited = Hash.new

  for i in 0..prerequisites.length-1
    subject, pre = prerequisites[i]

    inc[subject] ||= 0
    inc[subject] += 1
    graph[pre] ||= []
    graph[pre] << subject
  end

  queue = []

  for i in 0..num_courses-1
    if inc[i].to_i == 0
      queue << i
      visited[i] = 1
    end
  end

  while(!queue.empty?)
    l = queue.length

    for i in 0..l-1
      curr = queue.shift
      next if graph[curr].nil?

      for j in 0..graph[curr].length - 1
        subject = graph[curr][j]
        inc[subject] -= 1

        if inc[subject] == 0 && visited[subject].to_i == 0
          queue << subject
          visited[subject] = 1
        end
      end
    end
  end

  return visited.keys.length >= num_courses
end
