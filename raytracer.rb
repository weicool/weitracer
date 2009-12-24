require 'utilities'
require 'sampler'
require 'ray'

class RayTracer

  def initialize(shapes, lights, camera)
    @shapes = shapes
    @lights = lights
    @camera = camera
  end

end
