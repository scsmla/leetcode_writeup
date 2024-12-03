# @param {Integer[]} arr
# @return {Boolean}
def check_if_exist(arr)
  exist = Hash.new

  for i in 0..arr.length-1
    return true if arr[i] % 2 == 0 && !exist[arr[i] / 2].nil?
    return true if !exist[arr[i] * 2].nil?

    exist[arr[i]] = 1
  end

  false
end
