require 'utilities'
require 'sampler'
require 'ray'

class Camera

  attr_accessor :camera_loc

  def initialize(camera_loc)
    @camera_loc = camera_loc
  end

  def generate_ray(sample)
    direction = sample.world_space - @cameraLoc
    Ray.new(@camera_loc, direction, 1.0, MAX_FLOAT)
  end

end
