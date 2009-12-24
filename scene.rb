require 'utilities'

class Scene

  def initialize(sampler, camera, raytracer, film)
    @sampler = sampler
    @camera = camera
    @raytracer = raytracer
    @film = film
  end

  def render
    prev_y = 0
    @sampler.samples do |sample|
      ray = @camera.generate_ray(sample)
      color = @raytracer.trace(ray, TRACE_RECURSION_DEPTH)
      @film.commit(sample, color)
      
      y = sample.image_space.y 
      if y % 50 == 0 && y != prev_y
        debug y
        prev_y = y
      end
    end
  end

end
