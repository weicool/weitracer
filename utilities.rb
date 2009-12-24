require 'Matrix'

MAX_FLOAT = 10_000_000_000.0
TRACE_RECURSION_DEPTH = 1
SHADOW_BIAS = 0.0001

DEBUG = true
def debug(s)
  if DEBUG
    puts s
  end
end

class Color < Vector

  def r; self[0]; end
  def g; self[1]; end
  def b; self[2]; end

  def +(color); Color[self[0]+color[0], self[1]+color[1], self[2]+color[2]]; end
  def *(val)
    if val.respond_to?(:dot)
      Color[self[0]*val[0], self[1]*val[1], self[2]*val[2]]
    else
      Color[self[0]*val, self[1]*val, self[2]*val]
    end
  end

  def to_s; "Color[#{r}, #{g}, #{b}]"; end

end

class Vector

  alias_method :norm, :r
  alias_method :dot, :inner_product

  def x; self[0]; end
  def y; self[1]; end
  def z; self[2]; end

  def /(s)
    Vector[self[0]/s, self[1]/s, self[2]/s]
  end
  
  def normalize
    self / norm
    self
  end

end
