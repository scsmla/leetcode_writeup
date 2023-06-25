# @param {Integer[][]} tiles
# @param {Integer} carpet_len
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-white-tiles-covered-by-a-carpet/description/
def maximum_white_tiles(tiles, carpet_len)
  ans = 0
  j = 0
  cover = 0
  tiles = tiles.sort_by{|x| x[0]}
  i = 0
  n = tiles.length

  while(i < n && ans < carpet_len)
    if tiles[j][0] + carpet_len > tiles[i][1]
      cover += tiles[i][1] - tiles[i][0] + 1
      ans = [ans, cover].max
      i += 1
    else
      part = tiles[j][0] + carpet_len - tiles[i][0]
      ans = [ans, cover + part].max
      cover -= (tiles[j][1] - tiles[j][0]+1)
      j += 1
    end
  end

  ans
end
