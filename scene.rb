require 'utilities'

class Scene

  def initialize(sampler, camera, raytracer, film)
    @sampler = sampler
    @camera = camera
    @raytracer = raytracer
    @film = film
  end

  def render
    debug 'rendering...'
    
  end

end