# @param {String[]} recipes
# @param {String[][]} ingredients
# @param {String[]} supplies
# @return {String[]}
# Link: https://leetcode.com/problems/find-all-possible-recipes-from-given-supplies/description/
def find_all_recipes(recipes, ingredients, supplies)
  res = []
  g = Hash.new
  indegree = Hash.new
  for i in 0..ingredients.length-1
    for j in 0..ingredients[i].length-1
      ingre = ingredients[i][j]
      g[ingre] = [] if g[ingre].nil?
      g[ingre] << recipes[i]
      indegree[recipes[i]] = 0 if indegree[recipes[i]].nil?
      indegree[recipes[i]] += 1
    end
  end

  q = []
  for i in 0..supplies.length-1
    q << supplies[i]
  end

  while(!q.empty?)
    top = q.shift
    next if g[top].nil?
    for i in 0..g[top].length-1
      indegree[g[top][i]] -= 1

      if indegree[g[top][i]] == 0
        q.push(g[top][i])
      end
    end
  end

  for i in 0..recipes.length-1
    res.push(recipes[i]) if indegree[recipes[i]] == 0
  end

  res
end
