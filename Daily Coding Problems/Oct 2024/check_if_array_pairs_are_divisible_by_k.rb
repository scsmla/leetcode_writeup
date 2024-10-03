# @param {Integer[]} arr
# @param {Integer} k
# @return {Boolean}
def can_arrange(arr, k)
  modulo_hash = Hash.new

  arr.each do |num|
    modulo_hash[num%k] ||= 0
    modulo_hash[num%k] += 1
  end

  modulo_hash.each do |remainder, v|
    if remainder * 2 == k || remainder == 0
      return false if modulo_hash[remainder] % 2 != 0
    else
      return false if modulo_hash[remainder] != modulo_hash[k-remainder]
    end
  end

  true
end
