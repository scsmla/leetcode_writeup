# @param {Integer[][]} clips
# @param {Integer} time
# @return {Integer}
# Link: https://leetcode.com/problems/video-stitching/
def video_stitching(clips, time)
  dp = Array.new(time+1, time+1)
  dp[0] = 0

  for i in 1..time
    for j in 0..clips.length-1
      next if clips[j][1] < i || clips[j][0] > i
      dp[i] = [dp[clips[j][0]] + 1, dp[i]].min
    end
  end

  dp[time] == time+1 ? -1 : dp[time]
end
