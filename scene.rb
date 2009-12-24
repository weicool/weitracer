require 'utilities'

class Scene

  def initialize(sampler, camera, raytracer, film)
    @sampler = sampler
    @camera = camera
    @raytracer = raytracer
    @film = film
  end

  def render
    @sampler.samples do |sample|
      ray = @camera.generate_ray(sample)
      color = @raytracer.trace(ray, TRACE_RECURSION_DEPTH)
      @film.commit(sample, color)
    end
  end

end
