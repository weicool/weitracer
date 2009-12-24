class Light

  attr_reader :location, :intensity
  alias_method :direction, :location

  def initialize(location, intensity)
    @location = location
    @intensity = intensity
  end

  def get_ray(point)
    nil
  end

end

class DirectionalLight < Light

  def initialize(direction, intensity)
    super(direction, intensity)
  end

  def get_ray(point)
    Ray.new(point, (direction.clone*-1).normalize, SHADOW_BIAS, MAX_FLOAT)
  end

end
