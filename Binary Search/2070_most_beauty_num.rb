# @param {Integer[][]} items
# @param {Integer[]} queries
# @return {Integer[]}
# Link: https://leetcode.com/problems/most-beautiful-item-for-each-query/description/
def maximum_beauty(items, queries)
  items = items.sort_by{|x| x[0]}

  for i in 1..items.length-1
    items[i][1] = [items[i][1], items[i-1][1]].max
  end

  res = []

  for i in 0..queries.length-1
    q = queries[i]
    idx = items.bsearch_index{|x| x[0] > q}
    idx = items.length if idx.nil?
    if idx == 0
      res.push(0)
    else
      res.push(items[idx-1][1])
    end
  end

  res
end
