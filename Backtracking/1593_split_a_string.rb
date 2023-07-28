# @param {String} s
# @return {Integer}
# Link: https://leetcode.com/problems/split-a-string-into-the-max-number-of-unique-substrings/description/
def max_unique_split(s)
  @a = Hash.new
  @res = 0
  split(s, 0, "", 0)
  @res
end

def split(s, start, curr, count)
  if start == s.length && @a[curr].nil?
    @res = [@res, count].max

    return
  end

  for i in start..s.length-1
    curr += s[i]

    if @a[curr].to_i == 0
      @a[curr] = 1
      split(s, i+1, "", count+1)
      @a[curr] = nil
    end
  end
end
