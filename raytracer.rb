require 'utilities'
require 'sampler'
require 'ray'

class RayTracer

  def initialize(shapes, lights, camera)
    @shapes = shapes
    @lights = lights
    @camera = camera
  end

  def trace(ray, depth)
    
    Color[1.0, 0.0, 0.0, 1.0]
  end

  private

  def shade
    
  end

end
