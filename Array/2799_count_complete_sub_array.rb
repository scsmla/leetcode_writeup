# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/count-complete-subarrays-in-an-array/description/
def count_complete_subarrays(nums)
  cnt_q = nums.uniq.length
  n = nums.length
  res = 0

  for i in 0..n-1
    a = Hash.new
    cnt = 0
    for j in i.downto(0)
      if a[nums[j]].nil?
        a[nums[j]] = 1
        cnt += 1
      end

      break if cnt == cnt_q
    end

    res += (j+1) if cnt >= cnt_q
  end

  res
end
