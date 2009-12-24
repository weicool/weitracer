require 'utilities'
require 'sampler'
require 'ray'

class Camera

  attr_accessor :camera_loc

  def initialize(camera_loc)
    @camera_loc = camera_loc
  end

  def generate_ray(sample)
    Ray.new(@camera_loc, (sample.world_space - @camera_loc).normalize, 1.0, MAX_FLOAT)
  end

end
