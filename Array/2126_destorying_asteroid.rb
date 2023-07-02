# @param {Integer} mass
# @param {Integer[]} asteroids
# @return {Boolean}
# Link: https://leetcode.com/problems/destroying-asteroids/description/
def asteroids_destroyed(mass, asteroids)
  asteroids = asteroids.sort
  i = 0
  while(i < asteroids.length)
    return false if mass < asteroids[i]
    mass += asteroids[i]
    i += 1
  end

  true
end
