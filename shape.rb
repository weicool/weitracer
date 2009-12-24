require 'utilities'
require 'ray'

class Shape

  attr_reader :brdf

  def initialize(brdf, transform)
    @brdf = brdf
    @transform = transform
  end

  def intersect(ray)
    nil
  end

end

class Sphere < Shape

  def initialize(center, radius, brdf, transform)
    super(brdf, transform)

    @center = center
    @radius = radius
  end

  def intersect(ray)
    e = ray.point
    d = ray.direction
    c = @center

    k = e - c
    discriminant = (d.dot(k)**2) - (d.dot(d)*(k.dot(k) - @radius**2))
    return nil if discriminant <= 0

    t1 = ((-d.dot(k) + Math.sqrt(discriminant)) / d.dot(d))
    t2 = ((-d.dot(k) - Math.sqrt(discriminant)) / d.dot(d))

    t_hit = -1.0
    if (t1 >= ray.t_min && t1 <= ray.t_max) || (t2 >= ray.t_min && t2 <= ray.t_max)
      t_hit = [t1, t2].min
      t_hit = [t1, t2].max if t_hit < ray.t_min || t_hit > ray.t_max
    else
      return nil
    end

    intercept_point = e + d*t_hit
    normal = (intercept_point - c).normalize
    Intersection.new(self, intercept_point, normal, t_hit)
  end

end

class ShapeList < Array

  def intersect(ray)
    intersects = self.map{|shape| shape.intersect(ray)}.select{|intersect| intersect}
    intersects.min{|int_a, int_b| int_a.t_hit <=> int_b.t_hit}
  end

end
