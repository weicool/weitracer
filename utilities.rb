require 'Matrix'

MAX_FLOAT = 10_000_000_000.0

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

end
