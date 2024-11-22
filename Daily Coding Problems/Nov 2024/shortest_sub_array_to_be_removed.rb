# @param {Integer[]} arr
# @return {Integer}
def find_length_of_shortest_subarray(arr)
  n = arr.length

  for i in 1..n-1
    break if arr[i] < arr[i-1]
  end

  for j in (n-2).downto(0)
    break if arr[j] > arr[j+1]
  end

  return 0 if j.nil? || i.nil?

  temp_i = i
  temp_j = j

  min = [n-temp_i, temp_j+1].min

  for j in temp_j+1..n-1
    nex_g = arr[0..i-1].bsearch_index{|x| x > arr[j]}
    nex_g = i if nex_g.nil?
    nex_g -= 1

    min = [min, [j-nex_g-1, 0].max].min
  end

  min
end
