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

      unless in_shadow?(light_ray)
        color += shade(brdf, light_ray, ray, intersection, light_color)
      end
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
  
  def in_shadow?(light_ray)
    !@shapes.intersect(light_ray).nil?
  end

end
