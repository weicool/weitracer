class Light

  attr_reader :location, :intensity

  def initialize(location, intensity)
    @location = location
    @intensity = intensity
  end

  def get_ray(point)
    nil
  end

end

class DirectionalLight < Light

  alias_method :direction, :location

  def initialize(direction, intensity)
    super(direction, intensity)
  end

  def get_ray(point)
    Ray.new(point, (-direction.clone).normalize, SHADOW_BIAS, MAX_FLOAT)
  end

end
