require 'utilities'
require 'sampler'
require 'ray'
require 'shape'
require 'light'
require 'brdf'

class RayTracer

  def initialize(shapes, lights, camera)
    @shapes = shapes
    @lights = lights
    @camera = camera
    
    # temporary
    brdf = BRDF.new(Color[0.8, 0.0, 0.0], Color[1.0, 1.0, 1.0], Color[1.0, 1.0, 1.0], Color[1.0, 1.0, 1.0], 2.0)
    @shapes << Sphere.new(Vector[0.0, 0.0, -5.0], 1.0, brdf, nil)
    @lights << DirectionalLight.new(Vector[-1.0, -1.0, -1.0], Color[1.0, 1.0, 1.0])
  end

  def trace(ray, depth)
    color = Color[0.0, 0.0, 0.0]
    
    intersection = @shapes.intersect(ray)
    return color if depth <= 0 || !intersection
    
    brdf = intersection.shape.brdf
    color += brdf.ka
    
    # @lights.each do |light|
    #   light_ray = light.get_ray(intersection.point)
    #   light_color = light.intensity
    # end
    
    color
  end

  private

  def shade
    
  end

end
