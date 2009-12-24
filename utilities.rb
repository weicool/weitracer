require 'Matrix'

MAX_FLOAT = 10_000_000_000.0
TRACE_RECURSION_DEPTH = 1

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
  def to_s; "Color[#{r}, #{g}, #{b}]"; end

end

class Vector

  def x; self[0]; end
  def y; self[1]; end
  def z; self[2]; end

end
