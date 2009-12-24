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
    brdf = BRDF.new(Color[0.8, 0.0, 0.0], Color[1.0, 1.0, 1.0], Color[0.08, 0.0, 0.0], Color[1.0, 1.0, 1.0], 2.0)
    @shapes << Sphere.new(Vector[0.0, 0.0, -4.0], 1.0, brdf, nil)
    @lights << DirectionalLight.new(Vector[0.6, -0.6, -0.6], Color[1.0, 1.0, 1.0])
  end

  def trace(camera_ray, depth)
    color = Color[0.0, 0.0, 0.0]
    
    intersection = @shapes.intersect(camera_ray)
    return color if depth <= 0 || !intersection
    
    brdf = intersection.shape.brdf
    color += brdf.ka
    
    @lights.each do |light|
      light_ray = light.get_ray(intersection.point)
      light_color = light.intensity
      color += shade(brdf, light_ray, camera_ray, intersection, light_color)
    end
    
    color
  end

  private

  def shade(brdf, light_ray, camera_ray, intersection, light_color)
    color = Color[0.0, 0.0, 0.0]
    
    l = light_ray.direction.normalize
    n = intersection.normal.normalize
    camera_direction = camera_ray.direction.normalize
    
    # diffuse
    cos_angle = [l.dot(n), 0.0].max
    color += (brdf.kd*light_color) * cos_angle
    
    # specular
    
    color
  end

end
