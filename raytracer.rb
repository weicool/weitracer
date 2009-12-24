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
    brdf = BRDF.new(Color[0.8, 0.0, 0.0], Color[1.0, 1.0, 1.0], Color[0.08, 0.0, 0.0], Color[1.0, 1.0, 1.0], 20.0)
    @shapes << Sphere.new(Vector[0.0, 0.0, -4.0], 1.0, brdf, nil)
    @lights << DirectionalLight.new(Vector[0.6, -0.6, -0.6], Color[1.0, 1.0, 1.0])
  end

  def trace(ray, depth)
    color = Color[0.0, 0.0, 0.0]
    
    intersection = @shapes.intersect(ray)
    return color if depth <= 0 || !intersection
    
    brdf = intersection.shape.brdf
    color += brdf.ka
    
    @lights.each do |light|
      light_ray = light.get_ray(intersection.point)
      light_color = light.intensity
      color += shade(brdf, light_ray, ray, intersection, light_color)
    end
    
    color
  end

  private

  def shade(brdf, light_ray, camera_ray, intersection, light_color)
    l = light_ray.direction.normalize
    n = intersection.normal
    
    # diffuse
    cos_angle = [l.dot(n), 0.0].max
    color = (brdf.kd*light_color) * cos_angle
    
    # specular
    r = (n*l.dot(n)*2) - l
    phong = [r.dot(camera_ray.direction*-1), 0.0].max ** brdf.sp
    color += (brdf.ks*light_color) * phong
    
    color
  end

end
