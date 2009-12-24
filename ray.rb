require 'utilities'

class Ray

  attr_accessor :point, :direction, :t_min, :t_max

  def initialize(p, dir, min, max)
    @point = p
    @direction = dir
    @t_min = min
    @t_max = max
  end

end

class Intersection

  attr_accessor :shape, :point, :normal, :t_hit

  def initialize(s, p, n, hit)
    @shape = s
    @point = p
    @normal = n
    @t_hit = hit
  end

end
